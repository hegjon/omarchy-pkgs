# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt5-sip
pkgver=12.19.0
pkgrel=1
arch=(x86_64)
pkgdesc='The sip module support for PyQt5'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
depends=(glibc
         python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.python.org/packages/source/P/PyQt5-sip/pyqt5_sip-$pkgver.tar.gz)
sha256sums=('71cacf1879da2cd3e50cb239e21673cfe02d358af70ab6768817c960428868c3')

build() {
  cd pyqt5_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd pyqt5_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
