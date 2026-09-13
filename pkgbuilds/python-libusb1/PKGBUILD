# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=libusb1
pkgname=python-$_pkgname
pkgver=3.3.1
pkgrel=2
pkgdesc='Python ctype-based wrapper around libusb1'
arch=('any')
url='https://github.com/vpelletier/python-libusb1'
license=('LGPL2.1')
depends=('python' 'libusb')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e088730358287b7ca092165105d6ae796f8f130dce3af41b5c7b9df0a271dfdcee2d1a6d7a273fb95cdfe683d9d850d4da7a96ca51061d0f5ac321d3c276df73')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
