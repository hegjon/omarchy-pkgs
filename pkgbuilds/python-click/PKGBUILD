# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python-click
pkgver=8.3.3
pkgrel=1
pkgdesc="Simple wrapper around optparse for powerful command line utilities"
arch=('any')
url='https://click.palletsprojects.com/'
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=('python-pytest')
source=("https://github.com/pallets/click/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c2dc5eeb6b7e1ea8a4381fa657b753fdb3afdd5fd348987b8fcac4118a625f2689d19111838295a52916550223682152236530d67cdf5c732e3b22899f66b2bc')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
