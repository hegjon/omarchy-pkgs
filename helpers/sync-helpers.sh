# Shared machinery for the syncs that replace a package root with an upstream
# checkout (bin/sync-aur from the AUR, bin/sync-arch from Arch Linux's
# packaging repositories): PKGBUILD field access, Omarchy patches and hooks,
# pkgrel metadata, and the atomic swap into pkgbuilds/<package>/.
#
# Source message-helpers.sh and package-metadata.sh first.

get_pkgbuild_field() {
  local package_dir="$1"
  local field="$2"
  local value=""

  if [[ -f "$package_dir/PKGBUILD" ]]; then
    value=$(grep -m1 "^${field}=" "$package_dir/PKGBUILD" | cut -d= -f2- | tr -d "\"'") || true
    if [[ -n "$value" ]]; then
      echo "$value"
      return
    fi
  fi

  if [[ -f "$package_dir/.SRCINFO" ]]; then
    awk -F' = ' -v field="$field" '$1 ~ "^[[:space:]]*" field "$" { print $2; exit }' "$package_dir/.SRCINFO"
  fi
}

set_pkgrel() {
  local package_dir="$1"
  local pkgrel="$2"
  local pkgbuild="$package_dir/PKGBUILD"

  if [[ -f "$pkgbuild" ]]; then
    sed -i "s/^pkgrel=.*/pkgrel=$pkgrel/" "$pkgbuild"
  fi
}

# Drop files that only mean something to the upstream packaging repository.
# .SRCINFO and .gitignore are always removed; callers add their own.
remove_upstream_only_files() {
  local package_dir="$1"
  shift

  rm -f "$package_dir/.SRCINFO" "$package_dir/.gitignore"
  local extra
  for extra in "$@"; do
    rm -f "$package_dir/$extra"
  done
}

copy_upstream_contents() {
  local upstream_dir="$1"
  local target_dir="$2"

  mkdir -p "$target_dir"

  shopt -s dotglob nullglob
  local item base
  for item in "$upstream_dir"/*; do
    base=$(basename "$item")
    [[ "$base" == ".git" ]] && continue
    cp -a "$item" "$target_dir/"
  done
  shopt -u dotglob nullglob
}

commit_synced_worktree() {
  local work_dir="$1"
  local target_dir="$2"
  local parent base staged_dir backup_root backup_dir

  parent=$(dirname "$target_dir")
  base=$(basename "$target_dir")
  staged_dir=$(mktemp -d "$parent/.${base}.staged.XXXXXX")
  backup_root=$(mktemp -d "$parent/.${base}.backup.XXXXXX")
  backup_dir="$backup_root/$base"

  # Copy to the package filesystem before swapping. This keeps the original
  # package directory intact if copying from /tmp fails or is interrupted.
  if ! cp -a "$work_dir/." "$staged_dir/"; then
    print_error "Failed to stage synced package for $base"
    rm -rf "$staged_dir" "$backup_root"
    return 1
  fi

  if [[ -e "$target_dir" ]]; then
    if ! mv "$target_dir" "$backup_dir"; then
      print_error "Failed to back up existing package directory: $target_dir"
      rm -rf "$staged_dir" "$backup_root"
      return 1
    fi
  fi

  if ! mv "$staged_dir" "$target_dir"; then
    print_error "Failed to install synced package directory: $target_dir"
    if [[ -e "$backup_dir" ]]; then
      mv "$backup_dir" "$target_dir" || true
    fi
    rm -rf "$staged_dir" "$backup_root"
    return 1
  fi

  rm -rf "$backup_root" "$work_dir"
}

# set_metadata_string <package_dir> <key> <value>
set_metadata_string() {
  local package_dir="$1"
  local key="$2"
  local value="$3"
  local metadata="$package_dir/.omarchy/package.json"
  local tmpfile

  tmpfile=$(mktemp)
  jq --arg key "$key" --arg value "$value" '.[$key] = $value' "$metadata" > "$tmpfile"
  mv "$tmpfile" "$metadata"
}

set_upstream_commit() {
  set_metadata_string "$1" upstream_commit "$2"
}

# Returns 0 when at least one patch applied, 1 when there was nothing to
# apply, 2 when a patch failed.
apply_omarchy_patches() {
  local package_dir="$1"
  local patches_dir="$package_dir/.omarchy/patches"
  local applied=false

  [[ -d "$patches_dir" ]] || return 1

  shopt -s nullglob
  local patch_files=("$patches_dir"/*.patch)
  local patch_dir_files=("$patches_dir"/*)
  shopt -u nullglob

  if [[ ${#patch_files[@]} -eq 0 ]]; then
    if [[ ${#patch_dir_files[@]} -gt 0 ]]; then
      print_warning "No .patch files found in $patches_dir"
    fi
    return 1
  fi

  print_info "Applying Omarchy patches for $(display_package_name "$package_dir")..."
  local patch_file
  for patch_file in "${patch_files[@]}"; do
    print_info "  $(basename "$patch_file")"
    if ! (cd "$package_dir" && patch -p1 --forward --batch --no-backup-if-mismatch < "$patch_file"); then
      print_error "Failed to apply patch: $patch_file"
      return 2
    fi
    applied=true
  done

  [[ "$applied" == true ]]
}

# run_omarchy_post_sync_hook <package_dir> [VAR=value...]
#
# Runs .omarchy/post-sync.sh with the given environment. Returns 0 when the
# hook ran, 1 when there is no hook, 2 when it failed.
run_omarchy_post_sync_hook() {
  local package_dir="$1"
  shift
  local hook="$package_dir/.omarchy/post-sync.sh"

  [[ -f "$hook" ]] || return 1

  print_info "Running Omarchy post-sync hook for $(display_package_name "$package_dir")..."
  if ! (cd "$package_dir" && env "$@" bash ".omarchy/post-sync.sh"); then
    print_error "Failed to run post-sync hook: $hook"
    return 2
  fi

  return 0
}

apply_pkgrel_suffix_if_customized() {
  local package_dir="$1"
  local upstream_pkgrel="$2"

  [[ -n "$upstream_pkgrel" ]] || return 0

  print_info "Applying Omarchy pkgrel suffix for $(display_package_name "$package_dir"): pkgrel=$upstream_pkgrel.1"
  set_pkgrel "$package_dir" "$upstream_pkgrel.1"
}

# Returns 0 when pkgrel metadata was applied, 1 when there is none (or it was
# stale and removed), 2 on invalid input.
apply_pkgrel_override() {
  local package_dir="$1"
  local upstream_pkgrel="$2"
  local previous_pkgver="$3"
  local metadata="$package_dir/.omarchy/package.json"

  [[ -f "$metadata" ]] || return 1
  jq -e 'has("pkgrel")' "$metadata" >/dev/null || return 1

  local current_pkgver suffix offset base rel tmpfile
  # Read through the same accessor that produced previous_pkgver. Parsing it a
  # second time here let a quoted pkgver= compare unequal to itself, which threw
  # away the pkgrel metadata of an unchanged package on every sync.
  current_pkgver=$(get_pkgbuild_field "$package_dir" pkgver)

  if [[ -n "$previous_pkgver" && "$current_pkgver" != "$previous_pkgver" ]]; then
    print_info "Removing stale pkgrel metadata for $(display_package_name "$package_dir") (pkgver changed: $previous_pkgver -> $current_pkgver)"
    tmpfile=$(mktemp)
    jq 'del(.pkgrel)' "$metadata" > "$tmpfile"
    mv "$tmpfile" "$metadata"
    return 1
  fi

  suffix=$(jq -r '.pkgrel.suffix // 1' "$metadata")
  offset=$(jq -r '.pkgrel.offset // 0' "$metadata")

  if [[ ! "$offset" =~ ^[0-9]+$ || ! "$upstream_pkgrel" =~ ^[0-9]+$ ]]; then
    print_error "pkgrel offset requires numeric upstream pkgrel for $(display_package_name "$package_dir")"
    return 2
  fi

  base=$((upstream_pkgrel + offset))
  rel="$base.$suffix"

  print_info "Applying pkgrel suffix for $(display_package_name "$package_dir"): upstream pkgrel=$upstream_pkgrel, offset=$offset, suffix=$suffix -> pkgrel=$rel"
  set_pkgrel "$package_dir" "$rel"
  return 0
}

display_package_name() {
  local package_dir="$1"
  local name
  name=$(basename "$package_dir")
  echo "${name%.work}"
}
