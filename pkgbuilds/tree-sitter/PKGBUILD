# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=tree-sitter
pkgname=(
  tree-sitter
  tree-sitter-cli
)
pkgver=0.26.9
pkgrel=1
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter
license=(MIT)
makedepends=(
  clang
  cmake
  git
  glibc
  libgcc
  rust
)
options=(!lto) # Needed for CLI build
source=("git+$url.git#commit=v$pkgver")
b2sums=('3114f2f860ac72faf3a5993c5b26caa3001094e9b0acad5ebf97f0c782043172ae00378076c41441a836faabf5babe1377ec50cace43f6be34cb6cf2210ae4ab')
validpgpkeys=(FCC13F47A6900D64239FF13BE67890ADC4227273) # Amaan Qureshi <amaanq12@gmail.com>

prepare() {
  cd $pkgbase/crates/cli
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgbase
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON # Enable LTO
  cmake --build build

  cd crates/cli
  cargo build --release --locked --offline

  for completion in bash elvish fish nushell zsh; do
    cargo run --frozen --release -- \
      complete --shell $completion > $completion-completions
  done
}

package_tree-sitter() {
  pkgdesc='Incremental parsing library'
  depends=(
    glibc
  )
  provides=(libtree-sitter.so)

  cd $pkgbase
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}

package_tree-sitter-cli() {
  pkgdesc='CLI tool for developing, testing, and using Tree-sitter parsers'
  depends=(
    glibc
    libgcc
  )
  optdepends=('nodejs: for the generate subcommand')

  cd $pkgbase
  install -Dt "$pkgdir"/usr/bin target/release/$pkgbase
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgbase}-cli LICENSE

  cd crates/cli
  install -Dm644 bash-completions "$pkgdir"/usr/share/bash-completion/completions/$pkgbase
  install -Dm644 elvish-completions "$pkgdir"/usr/share/elvish/lib/$pkgbase.elv
  install -Dm644 fish-completions "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgbase.fish
  install -Dm644 nushell-completions "$pkgdir"/usr/share/nushell/vendor/autoload/$pkgbase.nu
  install -Dm644 zsh-completions "$pkgdir"/usr/share/zsh/site-functions/_$pkgbase
}
