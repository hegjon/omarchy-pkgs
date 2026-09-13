# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_server_terminals
pkgname=python-${_pyname//_/-}
pkgver=0.5.4
pkgrel=1
pkgdesc='A Jupyter Server extension providing terminals'
arch=(any)
url=https://github.com/jupyter-server/jupyter_server_terminals
license=(BSD-3-Clause)
depends=(jupyter-server
         python
         python-jupyter-core
         python-terminado
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter
              python-pytest-timeout)
source=(https://github.com/jupyter-server/jupyter_server_terminals/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('bbda128ed41d0be9020349f9f1f2a4ab9952a73ed5f5ac9f1419794761fb87f5')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
