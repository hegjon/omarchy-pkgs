# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=12.3.0
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-sybil' 'python-pytest-django' 'python-click'
              'python-django' 'python-loguru' 'python-numpy' 'python-pandas'
              'python-polars' 'python-pydantic' 'python-structlog' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('a511400328c63f08c1849a9cb767b451f74657a5e1dc058dd77c048879c2e2305e20d3bac084d7902408bf494abc49caba792c75d70be834761d77cea5f68c4c')

build() {
  cd testfixtures
  python -m build --wheel --no-isolation
}

check() {
  cd testfixtures
  PYTHONPATH="$PWD/src" pytest --ignore=build
}

package() {
  cd testfixtures
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
