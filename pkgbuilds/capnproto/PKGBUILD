# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Matthias Blaicher <matthias@blaicher.com>
# Contributor: Severen Redwood <severen@shrike.me>

pkgname=capnproto
pkgver=1.5.0
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system"
arch=(x86_64)
url="https://capnproto.org/"
license=(MIT)
depends=(
  glibc
  libgcc
  libstdc++
  openssl
  zlib
)
makedepends=(cmake)
provides=(
  libcapnp.so
  libcapnp-json.so
  libcapnp-rpc.so
  libcapnpc.so
  libkj-async.so
  libkj-gzip.so
  libkj-http.so
  libkj-test.so
  libkj-tls.so
  libkj.so
)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('d3072f590212d40010fa7946e000ac9fe927c9058fcda518c14275c7a217207db644d44a124398873d3875bb5f1f8e52dbeccfbc4b4c003e8e35fd83486fc343')
b2sums=('2e2170f7610069c5044cb00bf047784b2c8da8b32ee189c2e3f46606c3f11e7318bf1c833a3627f78a186238aa9f36cc5240cf991f97fb4c675ee472f877288b')

build() {
  # Coroutine support requires C++20
  CXXFLAGS+=" -std=c++20"

  local cmake_options=(
      -B build
      -D BUILD_SHARED_LIBS=ON
      -D WITH_FIBERS=ON
      -D CMAKE_BUILD_TYPE=None
      -D CMAKE_INSTALL_PREFIX=/usr
      -S $pkgname-$pkgver
      -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{CONTRIBUTORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
