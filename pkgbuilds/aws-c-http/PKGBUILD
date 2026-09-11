# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-http
pkgver=0.10.14
pkgrel=1
pkgdesc='C99 implementation of the HTTP/1.1 and HTTP/2 specifications'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-http'
license=(Apache-2.0)
depends=(
  aws-c-cal
  aws-c-common
  aws-c-compression
  aws-c-io
  glibc
)
makedepends=(cmake)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('26b31bf455f490e292142d5bf05e46d0366f52189fc78bddfb4c4afb5dfaff76182f4b045dff5b8f8a9c10f23556190a191e20fe941a67d6fccfdbf56ad63c87')

build() {
  cmake -S $pkgname-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
