# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=zlib
pkgname=lib32-$_name
pkgver=1.3.2
pkgrel=1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (32-bit)'
arch=(x86_64)
license=(Zlib)
url="https://www.zlib.net/"
depends=(
  lib32-glibc
  $_name
)
provides=(libz.so)
source=(https://github.com/madler/zlib/releases/download/v$pkgver/$_name-$pkgver.tar.xz{,.asc})
sha512sums=('cf3d49fbabddc57cca99858feeca8f910e9de42a16014cddd406814d2d24ee33fee2af3805d7efbb1b04b05f55818092b000daf82502b675df65f2512c353f73'
            'SKIP')
b2sums=('fd3a6e4c275a925f4814de487075c136e28421ea34ca7f93141781e7a414b392cd849fbf96cfcb24e825441df5f3c64be54276c0f617dc2d5c865d4ab260e83c'
        'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  make test -C $_name-$pkgver
}

package() {
  make install DESTDIR="$pkgdir" -C $_name-$pkgver

  rm -rf "$pkgdir"/usr/{include,share,bin}
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
