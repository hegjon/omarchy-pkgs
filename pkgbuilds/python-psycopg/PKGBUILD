# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.3.5
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=(x86_64)
url='https://www.psycopg.org/psycopg3/'
license=(LGPL-3.0-only)
depends=(
  glibc
  python
  postgresql-libs
)
makedepends=(
  git
  cython
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-pytest python-pytest-asyncio)
source=(
  "$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver"
  remove-version-constraint.patch
)
sha512sums=('ce3420ee6f166fa9ab433b6f3e29e9d3323cbd0e37bfa99687754d12dd5a431cf656f4321084d0a0aceb62594fbf2f0ec208642b4f2feeac58f9f5e17d77913d'
            'ed8107454e0384003a2108a985f9f573b635c0838b9c45d91b67dd4c1578bdbdceb54f1ffaf17a323a83ac454d2f8e6f72e24ef58367c9175891212c70470b39')
b2sums=('9c68d7df3f162f49ced3f7e63fd35b32cf3b2287afa1913ead059a3c35c37ea1033e5584edc543adc433ad661d2121e33e5b76ab1e4377ceda0ffc9c65096fc2'
        'acd2b3e276efca144d6602116670fcc062fbb079b717ff9bfc32412c4850892f88af9f7c51b8bc5835338210a71ffa26bb0841ea48a4a505cd9ec054248724a7')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraint.patch"
}

build(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m build --wheel --no-isolation
    popd
  done
}

package(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    popd
  done
}
