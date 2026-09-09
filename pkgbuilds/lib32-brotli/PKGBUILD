# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lib32-brotli
pkgver=1.2.0
pkgrel=2
pkgdesc='Generic-purpose lossless compression algorithm (32-bit)'
arch=(x86_64)
license=(MIT)
url=https://github.com/google/brotli
depends=(
  brotli
  lib32-gcc-libs
)
makedepends=(
  cmake
  git
)
provides=(
  libbrotli{common,dec,enc}.so
)
source=(git+https://github.com/google/brotli#tag=v$pkgver)
sha512sums=('36b8fadb3e5de540746eea19c758234095fafc0a4a687bd70fc70b0f74036c03cf9c70a7339aa1626f1197b5ac707bf5b01e393f6cd26c90b78519529724871a')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S brotli -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DBROTLI_BUILD_TOOLS=OFF
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/*.a,share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s brotli "${pkgdir}"/usr/share/licenses/lib32-brotli
}

# vim:set sw=2 sts=-1 et:
