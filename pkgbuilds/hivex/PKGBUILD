# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Robin Broda <coderobe @ archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=hivex
pkgver=1.3.24
pkgrel=8
pkgdesc="System for extracting the contents of Windows Registry"
arch=(x86_64)
url="http://libguestfs.org"
license=(
  GPL-2.0-or-later
  LGPL-2.1-only
)
depends=(
  bash
  glibc
  libxml2
  perl
  readline
)
makedepends=(
  chrpath
  ocaml
  ocaml-compiler-libs
  ocaml-findlib
  perl-io-stringy
  perl-test-simple
  python
  ruby
  ruby-rake
  ruby-rdoc
)
checkdepends=(ruby-minitest)
optdepends=(
  "python: python bindings"
  "ruby: ruby bindings"
  "ocaml: ocaml bindings"
)
source=("https://download.libguestfs.org/hivex/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('4b9be259e0359344aee2dce1e4df56d928b0e429abcc099479ba95b2940fb80cd285f22e6a914902bcc716e8b4b528f204bea10977913fc701ae45aacb66669b'
            'SKIP')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0') # Richard W.M. Jones <rjones@redhat.com>

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=' -ffat-lto-objects' \
  ./configure \
    --bindir=/usr/bin \
    --disable-rpath \
    --disable-static \
    --libdir=/usr/lib \
    --prefix=/usr
  make
  chrpath -d perl/blib/arch/auto/Win/Hivex/Hivex.so
  strip perl/blib/arch/auto/Win/Hivex/Hivex.so
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install
}
