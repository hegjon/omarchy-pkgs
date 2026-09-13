# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=gsoap
pkgver=2.8.144
pkgrel=1
pkgdesc="Offers an XML language binding to ease the development of SOAP/XML Web services in C and C/C++"
url="https://sourceforge.net/projects/gsoap2/"
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-gSOAP-Public-License-1.3')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl' 'zlib')
makedepends=('autoconf' 'automake')
options=('staticlibs')
source=("https://prdownloads.sourceforge.net/gsoap2/${pkgname}_${pkgver}.zip")
sha256sums=('b981818fbbd4bf9f6f4feac03136800f6e16a7d0b7515924ff7a2661ca26e581')

prepare() {
  cd "$srcdir"/gsoap-2.8
#  sed -i 's/#  if !defined(_GNU_SOURCE) ||/#  if !defined(_GNU_SOURCE) \&\&/' gsoap/stdsoap2.{c,cpp}
}

build() {
  cd "$srcdir"/gsoap-2.8
  # needed for programs which use gsoap and have -fPIC enabled
  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=353724
  export CFLAGS="$CFLAGS -fPIC -ffat-lto-objects"
  export CXXFLAGS="$CXXFLAGS -fPIC -ffat-lto-objects"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gsoap-2.8
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/gsoap/import
  mkdir -p "$pkgdir"/usr/share/gsoap/WS
  cp -R gsoap/import "$pkgdir"/usr/share/gsoap/
  cp -R gsoap/WS "$pkgdir"/usr/share/gsoap/
  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
