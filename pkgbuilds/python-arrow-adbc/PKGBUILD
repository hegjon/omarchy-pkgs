# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-arrow-adbc
pkgname=(
  python-arrow-adbc
  python-arrow-adbc-driver-flightsql
  python-arrow-adbc-driver-postgresql
  python-arrow-adbc-driver-sqlite
)
pkgver=24
pkgrel=1
pkgdesc='Database connectivity API for Apache Arrow'
arch=(x86_64)
url='https://arrow.apache.org/adbc/current/index.html'
license=(Apache-2.0)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
  cython
  cmake
  ninja
  go
  postgresql-libs
)
source=("$pkgbase::git+https://github.com/apache/arrow-adbc#tag=apache-arrow-adbc-$pkgver")
sha512sums=('a733afbf6c85a4562662dfd90ad03ab7f19f05af6650b83d591f61a869b4855a8d6ef4f251715456f876d8deaaf46eb332b9c54f6dc1a8bb45eab36dbe5a01ce')
b2sums=('7f77e0b76d641cdc667b7b41cd4ef7b8a62280da60a6da69d44a89ec1b7e8ad7f8f024d381c824767fa8b855b5baaa767bfe841dcc1d39481f745db2212bdf5d')

build() {
  local cmake_options=(
    -B build
    -S "$pkgbase/c"
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ADBC_BUILD_PYTHON=ON
    -D ADBC_DRIVER_MANAGER=ON
    -D ADBC_DRIVER_FLIGHTSQL=ON
    -D ADBC_DRIVER_POSTGRESQL=ON
    -D ADBC_DRIVER_SQLITE=ON
    -W no-author
  )

  cmake "${cmake_options[@]}"

  cmake --build build

  # build wheels
  cd "$pkgbase/python"

  pushd adbc_driver_flightsql
  ADBC_FLIGHTSQL_LIBRARY="$srcdir/build/driver/flightsql/libadbc_driver_flightsql.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_manager
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_postgresql
  ADBC_POSTGRESQL_LIBRARY="$srcdir/build/driver/postgresql/libadbc_driver_postgresql.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_sqlite
  ADBC_SQLITE_LIBRARY="$srcdir/build/driver/sqlite/libadbc_driver_sqlite.so" \
  python -m build --wheel --no-isolation
  popd
}

package_python-arrow-adbc() {
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-typing_extensions
    python-pandas
    python-pyarrow
  )
  optdepends=(
    'python-arrow-adbc-driver-flightsql: Flight SQL driver'
    'python-arrow-adbc-driver-postgresql: PostgreSQL driver'
    'python-arrow-adbc-driver-sqlite: SQLite driver'
  )

  cd "$pkgbase/python/adbc_driver_manager"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-flightsql() {
  pkgdesc+=' - Flight SQL driver'
  depends=(
    glibc
    python
    python-arrow-adbc
    python-importlib_resources
  )

  cd "$pkgbase/python/adbc_driver_flightsql"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-postgresql() {
  pkgdesc+=' - PostgreSQL driver'
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-arrow-adbc
    python-importlib_resources
    postgresql-libs
  )

  cd "$pkgbase/python/adbc_driver_postgresql"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-sqlite() {
  pkgdesc+=' - SQLite driver'
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-arrow-adbc
    python-importlib_resources
    sqlite
  )

  cd "$pkgbase/python/adbc_driver_sqlite"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
