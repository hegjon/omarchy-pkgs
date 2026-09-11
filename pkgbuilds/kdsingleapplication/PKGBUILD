# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdsingleapplication
pkgver=1.2.1
pkgrel=1
pkgdesc="KDAB's helper class for single-instance policy applications"
arch=(x86_64)
url='https://github.com/KDAB/KDSingleApplication'
license=(MIT)
depends=(glibc
         libgcc
         libstdc++
         qt6-base)
makedepends=(cmake
             git)
source=(git+https://github.com/KDAB/KDSingleApplication#tag=v$pkgver)
sha256sums=('d810760e42c26f1900ffdb3e3e34de1789025ef6cd538857f10ff5ed9dd7676f')

build() {
  cmake -B build -S KDSingleApplication \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDSingleApplication_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 KDSingleApplication/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
