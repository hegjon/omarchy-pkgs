# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=pycrdt
pkgname=python-$_pyname
pkgver=0.14.5
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(x86_64)
url='https://github.com/jupyter-server/pycrdt'
license=(MIT)
depends=(glibc
         libgcc
         python
         python-anyio)
makedepends=(git
             python-build
             python-installer
             python-maturin)
checkdepends=(python-anyio
              python-pydantic
              python-pytest
              python-pytest-mypy-testing
              python-trio)
source=(git+https://github.com/jupyter-server/pycrdt#tag=$pkgver)
sha256sums=('356f825bfe5e5585fa17976c9551d6f4250868550ea93a25457e8cf4283ecd96')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v \
    -k 'not test_types.py'
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
