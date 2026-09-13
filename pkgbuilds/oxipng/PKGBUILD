# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Nicolas F. <aur@fratti.ch>

pkgname=oxipng
pkgver=10.2.1
pkgrel=1
pkgdesc="A lossless PNG compression optimiser"
arch=(x86_64)
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('libgcc' 'glibc')
options=('!lto')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shssoichiro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('460ccfcdcc9c3877b9f7fae1dfd4f2a3f93d3b2a2af3e3b62ca32b163f923cca')

build() {
  cd "$pkgname-$pkgver"

  # Generate man page
  cargo xtask mangen

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/oxipng "$pkgdir/usr/bin/oxipng"
  install -Dm644 target/xtask/mangen/manpages/oxipng.1 "$pkgdir/usr/share/man/man1/oxipng.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
