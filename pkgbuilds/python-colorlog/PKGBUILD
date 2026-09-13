# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-colorlog
pkgver=6.10.0
pkgrel=1
pkgdesc='A colored formatter for the python logging module'
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('64e0865deaef9bf20207fe2030dfe0c3b6008877253b6c9e6c888133fde715e00352d71ac048689a78f56e6aa3873efd8824dc43651daf16dadbf6cf6ebfd4d5')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
