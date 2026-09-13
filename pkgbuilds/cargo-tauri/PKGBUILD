# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-tauri
_pkgname=tauri
pkgver=2.11.5
pkgrel=1
pkgdesc="Command line interface for building Tauri apps"
arch=('x86_64')
url="https://github.com/tauri-apps/tauri"
license=('MIT' 'Apache-2.0')
depends=(
  'appmenu-gtk-module'
  'base-devel'
  'bzip2' 'libbz2.so'
  'cargo'
  'curl'
  'file'
  'glibc'
  'libappindicator-gtk3'
  'libgcc'
  'librsvg'
  'openssl'
  'wget'
  'xdotool'
  'xz' 'liblzma.so'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/tauri-v$pkgver.tar.gz")
sha512sums=('666248aa1708e6920750a28e9365a2f480e0a660076d2dbc092e29a20764b586520d994575537a8fca08c2fe0ac9463be425a766cc3940224f9b3770cef0faa0')
options=('!lto')

prepare() {
  mv "$_pkgname-tauri-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver/crates/tauri-cli"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p completions
}

build() {
  cd "$pkgname-$pkgver/crates/tauri-cli"
  cargo build --release --frozen
  local _completion="../../target/release/$pkgname completions --shell"
  # $_completion bash > "completions/$pkgname"
  $_completion fish >"completions/$pkgname.fish"
  $_completion zsh >"completions/_$pkgname"
}

check() {
  cd "$pkgname-$pkgver/crates/tauri-cli"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver/crates/tauri-cli"
  install -Dm 755 "../../target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE_MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  # install -Dm664 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm664 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}

# vim: ts=2 sw=2 et:
