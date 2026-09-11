# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-importlib-metadata
pkgver=9.0.1
pkgrel=1
pkgdesc="Read metadata from Python packages"
url="https://importlib-metadata.readthedocs.io"
license=(Apache-2.0)
arch=(any)
depends=(
  python
  python-zipp
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-jaraco.test
  python-pytest
  python-pyfakefs
  python-pip
  python-tests
)
source=(
  "$pkgname::git+https://github.com/python/importlib_metadata.git#tag=v$pkgver?signed"
  remove-useless-dep.patch
)
sha512sums=('de3d67dd987e696e6cb258c5dd80a3bbfc3c93572a411e11ebebc7f360a134cfb4f2052f0fc5b556de7437c2af42486d1eecc44980e1c577de3585d5eb89b33d'
            'e5165e1b212f10d56724dc552e2cd75411bbe8c3b0d6b2d930f73e85e22596fade1cd3e84f8c93b4cd73bbf5cce8d3cf22ed489e4fdfe46c73a65d97f76e57b8')
validpgpkeys=('CE380CF3044959B8F377DA03708E6CB181B4C47E') # Jason R. Coombs <jaraco@jaraco.com>

prepare() {
  cd "$pkgname"

  # what is the point of this crud?
  patch -p1 -i "$srcdir/remove-useless-dep.patch"
}

build() {
  cd "$pkgname"

  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m pytest --ignore exercises.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
