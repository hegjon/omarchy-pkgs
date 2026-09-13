# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: David Verelst <david dot verelst at gmail com>
# Contributor: richli

pkgname=python-shapely
pkgver=2.1.2
pkgrel=2
pkgdesc="Manipulation and analysis of geometric objects in the Cartesian plane"
arch=(x86_64)
url="https://pypi.python.org/pypi/Shapely"
license=(BSD)
depends=(geos python)
optdepends=('python-numpy: for shapely.vectorized submodule')
makedepends=(python-build python-installer python-setuptools python-wheel python-numpy cython)
checkdepends=(python-pytest)
source=("https://pypi.io/packages/source/s/shapely/shapely-${pkgver}.tar.gz")
sha512sums=('91fe2dd602121cf216f22c899e1557edcb53b9e32681d40b15bbe6d32d342625d6e6ef7b3a5d21fd606cab851b094e6ca87b6ec699f478fefe851eb7b3c8afb6')

build() {
  cd shapely-$pkgver
  CFLAGS+=" -Wno-incompatible-pointer-types" \
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd shapely-$pkgver/build/lib.linux-x86_64-cpython-${python_version}
  PYTHONPATH="$PWD" pytest -vv --color=yes
}

package() {
  cd shapely-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
