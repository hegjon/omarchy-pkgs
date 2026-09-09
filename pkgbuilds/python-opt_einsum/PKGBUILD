# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-opt_einsum
pkgver=3.4.0
pkgrel=2
pkgdesc="Optimizing einsum functions in NumPy, Tensorflow, Dask, and more with contraction order optimization"
url="https://github.com/dgasmith/opt_einsum"
license=(MIT)
arch=(any)
depends=(
  python
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatchling
  python-hatch-vcs
  python-hatch-fancy-pypi-readme
  git
)
checkdepends=(
  python-pytest
)
source=("git+https://github.com/dgasmith/opt_einsum#tag=v${pkgver}")
sha512sums=('b904096770a583b34cd26afffe2ee0185fa8716741721a3e13f493793206fc847c7e42f2e209d7289eb7af3147123be4e3312d9dcd21d873fcc5cc9f4ac6a3e0')

build() {
  cd opt_einsum
  python -m build --wheel --no-isolation
}

check() {
  cd opt_einsum
  pytest -vv
}

package() {
  cd opt_einsum
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
