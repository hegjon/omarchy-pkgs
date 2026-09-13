# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=blosc
pkgver=1.21.6
pkgrel=2
pkgdesc='A blocking, shuffling and loss-less compression library'
arch=(x86_64)
url='https://www.blosc.org'
license=(BSD-3-Clause)
depends=(
  glibc
  lz4
  snappy
  zlib
  zstd
)
makedepends=(git cmake)
source=("$pkgname::git+https://github.com/Blosc/c-blosc#tag=v$pkgver")
sha512sums=('ea5e14ed1ece973e8cb31544cc016ae01b4f59ae7b6e6425c8703f98bda68eff8fc6382fb6e2cb4ec406db22a9229de8148df9a9aca8570f218c431866f709cc')
b2sums=('e9027864a8a2f67cda8d7f71f22cfd4c99ace91b57ca02c1de274e36c546cad7e9dcb387323ca2924c3daf006f60f1f8a918f1e8c4b5a1cc3b0e248bfd895d0d')

prepare() {
  cd "$pkgname"

  # update minimal cmake version
  git cherry-pick --no-commit 051b9d2cb9437e375dead8574f66d80ebce47bee
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_STATIC=OFF
    -D DEACTIVATE_SNAPPY=OFF
    -D PREFER_EXTERNAL_LZ4=ON
    -D PREFER_EXTERNAL_ZLIB=ON
    -D PREFER_EXTERNAL_ZSTD=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

check() {
  cd build

  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.txt"
}
