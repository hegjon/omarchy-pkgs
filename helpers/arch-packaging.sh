# Access to Arch Linux's packaging repositories for bin/sync-arch and
# bin/package-worktree.
#
# Arch publishes two things this tooling reads:
#
#   packaging/state           one file per released package in
#                             <repo>-<arch>/<pkgbase>, each holding
#                             "pkgbase version tag commit". This is the
#                             overview of what Arch has released.
#   packaging/packages/<path> one git repository per pkgbase holding the
#                             PKGBUILD; the state file's commit points into it.
#
# Only the released repositories (core, extra, multilib) are consulted, never
# testing, staging or the desktop-environment preview repositories.
#
# Source message-helpers.sh first.

ARCH_STATE_URL="${OMARCHY_ARCH_STATE_URL:-https://gitlab.archlinux.org/archlinux/packaging/state.git}"
ARCH_PACKAGES_URL="${OMARCHY_ARCH_PACKAGES_URL:-https://gitlab.archlinux.org/archlinux/packaging/packages}"
ARCH_STATE_REPOS="core extra multilib"
ARCH_STATE_ARCHES="x86_64 any"

# Set by arch_state_sync.
ARCH_STATE_DIR="${OMARCHY_ARCH_STATE_DIR:-}"

# pkgbase -> GitLab project path, following devtools' gitlab_project_name_to_path.
arch_gitlab_path() {
  printf '%s' "$1" | sed -E \
    -e 's/([a-zA-Z0-9]+)\+([a-zA-Z]+)/\1-\2/g' \
    -e 's/\+/plus/g' \
    -e 's/[^a-zA-Z0-9_\-\.]/-/g' \
    -e 's/[_\-]{2,}/-/g' \
    -e 's/^tree$/unix-tree/'
}

arch_package_url() {
  echo "$ARCH_PACKAGES_URL/$(arch_gitlab_path "$1").git"
}

# arch_state_sync <scratch_dir>
#
# Makes ARCH_STATE_DIR an up-to-date checkout of packaging/state. With
# OMARCHY_ARCH_STATE_DIR set, that clone is reused and pulled; otherwise a
# shallow clone lands under the scratch directory.
arch_state_sync() {
  local scratch="$1"
  local attempt log="$scratch/state-sync.log"

  if [[ -z "$ARCH_STATE_DIR" ]]; then
    ARCH_STATE_DIR="$scratch/state"
  fi

  for attempt in 1 2 3; do
    if [[ -d "$ARCH_STATE_DIR/.git" ]]; then
      if git -C "$ARCH_STATE_DIR" pull -q --ff-only >"$log" 2>&1; then
        return 0
      fi
    else
      rm -rf "$ARCH_STATE_DIR"
      if git clone -q --depth=1 "$ARCH_STATE_URL" "$ARCH_STATE_DIR" >"$log" 2>&1; then
        return 0
      fi
    fi
    if [[ $attempt -lt 3 ]]; then
      print_warning "Syncing $ARCH_STATE_URL failed (attempt $attempt/3), retrying in 10s..."
      sleep 10
    fi
  done

  print_error "Failed to sync Arch packaging state: $(tail -n 1 "$log")"
  return 1
}

# arch_state_lookup <pkgbase>
#
# Prints "repo version tag commit" for the released build of pkgbase, or
# returns 1 when Arch does not ship it. A package that moved between the
# x86_64 and any trees leaves its old state file behind, so when several
# files exist the highest version wins.
arch_state_lookup() {
  local pkgbase="$1"
  local repo arch file name version tag commit
  local best_repo="" best_version="" best_tag="" best_commit=""

  for repo in $ARCH_STATE_REPOS; do
    for arch in $ARCH_STATE_ARCHES; do
      file="$ARCH_STATE_DIR/$repo-$arch/$pkgbase"
      [[ -f "$file" ]] || continue
      read -r name version tag commit < "$file"
      [[ "$name" == "$pkgbase" && -n "$version" && -n "$tag" && -n "$commit" ]] || continue
      if [[ -z "$best_version" || "$(vercmp "$version" "$best_version")" -gt 0 ]]; then
        best_repo="$repo"
        best_version="$version"
        best_tag="$tag"
        best_commit="$commit"
      fi
    done
  done

  [[ -n "$best_commit" ]] || return 1
  echo "$best_repo $best_version $best_tag $best_commit"
}

# arch_fetch_package <pkgbase> <commit> <tag> <dest>
#
# Checks out one released commit of a packaging repository into dest. The
# commit is fetched directly; when the server refuses a bare sha, the release
# tag reaches the same commit.
arch_fetch_package() {
  local pkgbase="$1"
  local commit="$2"
  local tag="$3"
  local dest="$4"
  local url attempt log

  url=$(arch_package_url "$pkgbase")
  log="$(dirname "$dest")/fetch-$(basename "$dest").log"

  for attempt in 1 2 3; do
    rm -rf "$dest"
    if git -c init.defaultBranch=main init -q "$dest" &&
      git -C "$dest" remote add origin "$url" &&
      {
        git -C "$dest" fetch -q --depth=1 origin "$commit" >"$log" 2>&1 ||
          { [[ -n "$tag" ]] && git -C "$dest" fetch -q --depth=1 origin "refs/tags/$tag" >"$log" 2>&1; }
      } &&
      git -C "$dest" checkout -q --detach "$commit" >>"$log" 2>&1; then
      return 0
    fi
    if [[ $attempt -lt 3 ]]; then
      print_warning "Fetch of $pkgbase@${commit:0:12} failed (attempt $attempt/3), retrying in 10s..."
      sleep 10
    fi
  done

  print_warning "Failed to fetch $pkgbase@${commit:0:12} from $url after 3 attempts: $(tail -n 1 "$log" 2>/dev/null)"
  rm -rf "$dest"
  return 1
}
