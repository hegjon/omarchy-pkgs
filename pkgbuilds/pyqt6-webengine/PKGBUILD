# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-webengine
pkgname=(python-pyqt6-webengine)
pkgver=6.11.0
pkgrel=1
pkgdesc='Python bindings for QtWebEngine'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtwebengine/intro'
license=(GPL3)
groups=(pyqt6)
depends=(glibc
         libstdc++
         python
         python-pyqt6
         qt6-base
         qt6-webengine)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-WebEngine/pyqt6_webengine-$pkgver.tar.gz)
sha256sums=('15cf49efbbbd4c6bc87653b2c4ae80d6049f800e31620b336734ae2e37cbedae')

build() {
  cd pyqt6_webengine-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-webengine() {
  cd pyqt6_webengine-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
