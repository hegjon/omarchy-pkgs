# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mongo-c-driver
pkgver=2.4.0
pkgrel=1
pkgdesc="A client library written in C for MongoDB"
arch=(x86_64)
url="https://github.com/mongodb/mongo-c-driver"
license=(Apache-2.0)
depends=(
  glibc
  libsasl
  openssl
  snappy
  zstd
)
makedepends=(cmake)
provides=(
  libbson
  libbson2.so
  libmongoc
  libmongoc2.so
)
conflicts=(
  libbson
  libmongoc
)
replaces=(
  libbson
  libmongoc
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('23cdfbf77da09492ecd5df2133458498543d8a871550a688e63862e5a8cd0235d43489bfa2e792599ab4e81850b3cf0a4fc46c95d318d63513ee26d217923217')

build() {
  cd $pkgname-$pkgver
  # ENABLE_STATIC=BUILD_ONLY and DENABLE_STATIC_LIBBSON_INSTALL=OFF 
  # is required to build tests, without installing .a libs and cmake stuff for *::static.
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_VERSION="$pkgver" \
    -DENABLE_STATIC=BUILD_ONLY \
    -DENABLE_STATIC_LIBBSON_INSTALL=OFF \
    -DMONGOC_INSTALL_INCLUDEDIR=include \
    -DBSON_INSTALL_INCLUDEDIR=include \
    -DENABLE_TESTS=ON
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target check
  export MONGOC_TEST_OFFLINE=ON
  export MONGOC_TEST_SKIP_LIVE=ON
  local skip_tests=(
    mongoc/Client/exhaust_cursor/err/network/2nd_batch/pooled
    mongoc/Client/exhaust_cursor/err/network/2nd_batch/single
    mongoc/Client/recovering
    mongoc/Client/ssl/reconnect/pooled
    mongoc/ClientPool/openssl/change_ssl_opts
    mongoc/MongoDB/handshake/null_args
    mongoc/azure/imds/http/talk
    mongoc/gcp/http/talk
    mongoc/pkg-config/bson-import-static
    mongoc/pkg-config/mongoc-import-shared
    mongoc/pkg-config/mongoc-import-static
  )
  local skip_tests_pattern="${skip_tests[0]}$(printf '|%s' "${skip_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skip_tests_pattern"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
