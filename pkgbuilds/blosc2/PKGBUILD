# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
pkgver=3.3.3
pkgrel=1
pkgdesc='A fast, compressed, persistent binary data store library for C'
arch=(x86_64)
url='https://www.blosc.org'
license=(BSD-3-Clause)
depends=(
  glibc
  lz4
  zlib-ng
  zstd
  zfp
)
makedepends=(
  git
  cmake
)
provides=(libblosc2.so)
source=("$pkgname::git+https://github.com/Blosc/c-blosc2#tag=v$pkgver")
sha512sums=('d29277ca25f93ab44af6cd6db9b93bcd3a32a846cbaad3d8ce3148694594aeefdee8d8f6e39cc7e7e76afa0941c10d1b3f22191e51940c83acf349e49c8296f2')
b2sums=('93b65c8b66bb097d58284d0f44961b812882b3dbba13fc471ef099457b08484a4d405ada68781014c570b2aa81d5ba654b6c0800abffd9b5b24fa63b5727d23f')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D PREFER_EXTERNAL_LZ4=ON
    -D PREFER_EXTERNAL_ZLIB=ON
    -D PREFER_EXTERNAL_ZSTD=ON
    -D BLOSC_DEPENDENCY_MODE=EXTERNAL
    -D BUILD_SHARED_LIBS=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.txt"
}
