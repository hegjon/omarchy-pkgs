# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Emmanuel 'guinness' Boudreault
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=lib32-libunistring
pkgver=1.4.2
pkgrel=1
pkgdesc='Library for manipulating Unicode strings and C strings (32-bit)'
url='https://www.gnu.org/software/libunistring/'
arch=('x86_64')
license=(
  GPL-2.0-or-later
  LGPL-3.0-or-later
)
depends=('libunistring' 'lib32-glibc')
source=(https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz{,.sig})
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno <ueno@unixuser.org>
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D'
              'E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Open Source Development) <bruno@clisp.org>
sha512sums=('0215f7f40f426227eca5174140654a3fa43ac1520eeb212c2ba08043470f905687b2703afdda12e9635359a6187643900136b6bb11b422bd7567d17ca71b555f'
            'SKIP')

build() {
  cd libunistring-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

check() {
  make -C libunistring-${pkgver} check
}

package() {
  make -C libunistring-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
