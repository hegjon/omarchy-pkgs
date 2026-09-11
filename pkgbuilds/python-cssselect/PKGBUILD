# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>

pkgname=python-cssselect
pkgver=1.5.0
pkgrel=1
license=('BSD-3-Clause')
arch=('any')
url="https://pypi.python.org/pypi/cssselect"
pkgdesc="A Python3 library that parses CSS3 Selectors and translates them to XPath 1.0"
depends=('python')
makedepends=('git' 'python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-lxml')
source=("git+https://github.com/scrapy/cssselect.git#tag=v$pkgver")
sha512sums=('e50d1b905df5b6d08550c6758ae9005370fdaca74f56f0e59fdc8522a9038f5a320a7a42ef9e7695834c46b36df94252db4405bb92ee57548b20fad9a451edad')

build() {
  cd cssselect
  python -m build --wheel --no-isolation
}

check() {
  cd cssselect
  pytest
}

package() {
  cd cssselect
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
