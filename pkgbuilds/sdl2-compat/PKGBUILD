# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2-compat
pkgver=2.32.72
pkgrel=1
pkgdesc="An SDL2 compatibility layer that uses SDL3 behind the scenes"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('sdl3' 'glibc')
makedepends=('cmake' 'ninja')
arch=('x86_64')
conflicts=('sdl2')
provides=("sdl2=${pkgver}")
replaces=('sdl2')
license=('Zlib')
source=("https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}.tar.gz"{,.sig})
sha512sums=('0d5d8b26bbb92e25a102e734daeed8b2345957eec95c01ccfcb1461030c8e12300e19488a1eec45d217c56b64cefe8722d84f3e5c5d013efea9128161174b785'
            'SKIP')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B') # Sam Lantinga


build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s sdl2-compat.pc "${pkgdir}/usr/lib/pkgconfig/sdl2.pc"

  install -Dm644 "sdl2-compat-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
