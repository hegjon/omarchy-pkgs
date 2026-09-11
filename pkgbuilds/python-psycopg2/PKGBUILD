# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python-psycopg2
pkgver=2.9.12
pkgrel=1
pkgdesc="A PostgreSQL database adapter for the Python programming language."
arch=(x86_64)
url="https://www.psycopg.org/"
license=(LGPL-3.0-or-later)
depends=(
  glibc
  postgresql-libs
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://github.com/psycopg/psycopg2/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('7019dec7f7154a1000ea3c65e5e1d1dbd18f970b9eaf631c1b3de3b0578964c0faa7a53118d1855a893b0955774431a47d85fc02d107eddb888068306a871ba1')

prepare(){
  cd "psycopg2-${pkgver}"
  sed -i 's/,PSYCOPG_DEBUG$//' setup.cfg
}

build(){
  cd "psycopg2-${pkgver}"
  CFLAGS+=" -Wno-implicit-function-declaration" \
  python -m build --wheel --no-isolation
}

check() {
  cd "psycopg2-${pkgver}"
  # TODO: run unit tests which don't require a postgresql server, for now try to import the module to verify
  # it can be imported with a newer Python version.
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" python3 -c 'import psycopg2'
}

package() {
  cd "psycopg2-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
