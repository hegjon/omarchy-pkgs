# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-io
pkgver=0.26.3
pkgrel=1
pkgdesc='AWS SDK module to handle all IO and TLS work for application protocols'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-io'
license=(Apache-2.0)
depends=(
  aws-c-cal
  aws-c-common
  glibc
  s2n-tls
)
makedepends=(cmake)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a4131ae6bc4ee023554144d6571088e225d1589d669b35c94a1b610f52251824ce367287fdd0bf10fc3ecfdd740a7992cefab6b7a08a44bec209eb5dcb3a9eea')

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
