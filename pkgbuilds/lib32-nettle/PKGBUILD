# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

_pkgbasename=nettle
pkgname=lib32-$_pkgbasename
pkgver=4.0
pkgrel=2
pkgdesc="A low-level cryptographic library (32-bit)"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=('LGPL-3.0-or-later OR GPL-2.0-or-later')
depends=('lib32-glibc' 'lib32-gmp' $_pkgbasename=$pkgver)
makedepends=(gcc-multilib)
provides=('libnettle.so' 'libhogweed.so')
source=(https://ftp.gnu.org/gnu/nettle/$_pkgbasename-$pkgver.tar.gz{,.sig})
sha256sums=('3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094'
            'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

build() {
  cd $_pkgbasename-$pkgver

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export CPPFLAGS+=" -m32 -I/usr/lib32/gmp"
  export LDFLAGS+=" -m32 -L/usr/lib32 -lgmp"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-shared
  make
}

check() {
  cd $_pkgbasename-$pkgver
  # make -k check
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
