# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=6.0.0
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/syrupy-project/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-attrs' 'python-hypothesis' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/syrupy-project/syrupy.git#tag=v$pkgver")
sha512sums=('ab11cdbee6c5fe32707177ca62c3817b5c5592efabbae82dee415464870c9c0aaba90986a79ffa1fd604c176a0b80e5d3e22545b363b802b8f0fa8710d36be7f')

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
