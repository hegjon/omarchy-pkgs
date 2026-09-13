# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgbase=quazip
pkgname=(quazip-qt6)
pkgver=1.7.2
pkgrel=1
pkgdesc='C++ wrapper for the ZIP/UNZIP C package'
url='https://stachenov.github.io/quazip/'
license=(LGPL-2.1-or-later)
arch=(x86_64)
depends=(bzip2
         glibc
         libgcc
         libstdc++
         qt6-base
         qt6-5compat
         zlib)
makedepends=(cmake
             git)
source=(git+https://github.com/stachenov/quazip#tag=v$pkgver)
sha256sums=('0c8cdc7a5a587f8c544ca73b47b29cb6741f6b61181f3e2b519dbb2746b79164')

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUAZIP_QT_MAJOR_VERSION=6
  cmake --build build
}

package_quazip-qt6() {
  DESTDIR="$pkgdir" cmake --install build
}
