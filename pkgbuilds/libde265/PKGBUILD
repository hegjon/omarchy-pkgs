# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=1.1.2
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(glibc
         libgcc
         libstdc++)
makedepends=(cmake
             git
             sdl2-compat)
optdepends=('sdl2-compat: for the decoder tool')
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('e8d563369abc3a56a5747be68cf517d3cf1d2f431a39664224ca0162df96de32')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_ENCODER=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
