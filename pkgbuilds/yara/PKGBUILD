# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=yara
pkgver=4.5.8
pkgrel=1
pkgdesc='Tool aimed at helping malware researchers to identify and classify malware samples'
url='https://github.com/VirusTotal/yara'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  glibc
  openssl
  file
  libmagic.so
)
provides=(
  libyara.so
)
source=(
  "https://github.com/VirusTotal/yara/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha512sums=('12bbe1bebb6d51f7ae90ad6a725bdb096f3e884b757913e9ba37bfa1557bced32ef56895eb358af5f3165890336be57dc51e9fe2ad672c1e523cb30e00483c86')
b2sums=('2e842921aa757d6c592e8eaa2d69cca5d8d8f054b4624ba97b6ac5edd9f56789aa6ad5e64f5ab50986731a42d922dfb2510aa8d6b8676f4cfade3d76bc1aa177')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --with-crypto \
    --enable-magic
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  rm -vr "$pkgdir/usr/share/doc/yara/docs/conf.py"
}
