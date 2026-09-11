# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Pajaro

pkgname=dssi
pkgver=1.1.1
pkgrel=14
pkgdesc="An API for audio processing plugins & softsynths with UIs"
arch=(x86_64)
url="https://dssi.sourceforge.net/"
license=(
  LGPL-2.1-or-later
  LicenseRef-BSD-style
)
depends=(
  alsa-lib
  glibc
  jack
  libgcc
  liblo
  libstdc++
)
makedepends=(
  ladspa
  libsamplerate
  libsndfile
)
optdepends=(
  'libsamplerate: for trivial_sampler plugin'
  'libsndfile: for trivial_sampler plugin'
)
provides=(dssi-host)
source=(
  https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
  $pkgname-1.1.1-gcc14-fixes.patch
)
sha512sums=('faf35ae851b889ad17a8ba624c713af8a5f33bb93db8e34842e8b778a0e36c3eab9ab712a40e4ca7ecd96954f3e70504d89a75b3826dd138332085e176c0d34d'
            'f97f6f138d497fdd3bdda7f0258db43f6a85156406ab485d37aa7002866fe35a8165af5fc7c0c08f140e0f6bb2776594ce49a25836d166edd3b9e6ac4cd62f7c')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-1.1.1-gcc14-fixes.patch
  sed -n '22,29p; s| * ||' $pkgname-$pkgver/jack-dssi-host/jack-dssi-host.c > BSD-style
  cd $pkgname-$pkgver
  autoreconf -vfi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver

  install -vDm 644 BSD-style -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{ChangeLog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
