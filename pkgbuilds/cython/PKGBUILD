# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython
pkgver=3.2.9
pkgrel=1
pkgdesc='C-Extensions for Python'
arch=(x86_64)
url='https://cython.org'
license=(Apache-2.0)
depends=(glibc
         python
         python-numpy
         python-pygments
         python-setuptools)
makedepends=(git
             python-build
             python-installer
             python-wheel)
checkdepends=(gdb
              python-interpreters-pep-734
              python-pytest
              python-tests)
source=(git+https://github.com/cython/cython#tag=$pkgver)
sha256sums=('c7bc8839708ca1a090e7c016048b6a6fd6a9ccab87975aa457fd8b4c014402db')

prepare() {
  cd cython
  git cherry-pick -n d344f9b284549362dee39af7a74a9c669bb65ce8 # Do not embed absolute paths of source files (breaks packaging)
  git cherry-pick -n fd847477a47855f9c0d036f35c8865196d5267cc # Drop pkg_resources usage
}

build() {
  cd cython
  python -m build --wheel --no-isolation
}

check() {
  cd cython
  python runtests.py -vv -j 64 --no-pyregr
}

package() {
  cd cython
  python -m installer --destdir="$pkgdir" dist/*.whl

  for f in cygdb cython cythonize; do
    mv "$pkgdir"/usr/bin/$f "$pkgdir"/usr/bin/${f}3
    ln -s ${f}3 "$pkgdir"/usr/bin/$f
  done
}
