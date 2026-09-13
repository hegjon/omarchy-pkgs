# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jovan Lanik <jox969@gmail.com>

pkgname=gtklock
pkgver=4.0.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
url="https://github.com/jovanlanik/gtklock"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('pam' 'wayland' 'gtk3' 'gtk-session-lock')
makedepends=('meson' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db20bf27bd5dd01901ea1753c89c170777dd7cf8fca19130cf90f5f4e3fb9633')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}

