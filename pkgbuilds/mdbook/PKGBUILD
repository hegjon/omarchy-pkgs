# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=0.5.4
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang/mdBook"
arch=('x86_64')
license=('MPL2')
depends=(
  'libgcc'
)
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rust-lang/mdBook/archive/v${pkgver}.tar.gz")
sha256sums=('107614330c35c77d53b6f6ce7826c50eed087650efe5646a4d0a16ca6bf5544b')
# https://github.com/rust-lang/mdBook/blob/master/CHANGELOG.md

prepare() {
  cd "mdBook-${pkgver}"
  mkdir -p completions
  cargo fetch --locked --target host-tuple
}

build() {
  cd "mdBook-${pkgver}"
  cargo build --frozen --release
  "./target/release/$pkgname" completions bash > "completions/$pkgname.bash"
  "./target/release/$pkgname" completions fish > "completions/$pkgname.fish"
  "./target/release/$pkgname" completions zsh > "completions/_$pkgname"
}

check() {
  cd "mdBook-${pkgver}"
  cargo test --frozen
}

package() {
  cd "mdBook-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
}
