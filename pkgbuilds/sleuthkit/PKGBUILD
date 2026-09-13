# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=sleuthkit
pkgver=4.15.0
pkgrel=1
pkgdesc='File system and media management forensic analysis tools'
arch=('x86_64')
url="https://www.sleuthkit.org/sleuthkit"
license=(
  'CPL-1.0'
  'GPL-2.0-or-later'
  'IPL-1.0'
)
depends=(
  'glibc'
  'libewf'
  'libgcc'
  'libstdc++'
  'perl'
  'sqlite'
  'zlib'
)
makedepends=('autoconf-archive')
provides=('libtsk.so')
source=("https://github.com/sleuthkit/sleuthkit/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('1fde6d5c82bd97e01bb6ce048290c4f7e38541128492d0d9494328df6b6db217f557c42ed7147b9eeba3e6ff2c9bb011b23d1ea25050b1488a0a80b571e2f5e5'
        'SKIP')
validpgpkeys=('0917A7EE58A9308B13D3963338AD602EC7454C8B') # Brian Carrier <carrier@sleuthkit.org>

build() {
  cd $pkgname-$pkgver
  export CFLAGS+=" -std=gnu17"
  # From upstream's bootstrap script
  aclocal \
    && (libtoolize --force || glibtoolize --force) \
    && automake --foreign --add-missing --copy \
    && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" licenses/*
}
