# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=softhsm
pkgver=2.7.0
pkgrel=1
pkgdesc="Software PKCS#11 store"
arch=('x86_64')
url="https://opendnssec.readthedocs.io/en/latest/softhsm2/"
license=('BSD-2-Clause')
depends=('botan' 'sqlite3' 'openssl' 'p11-kit')
makedepends=('git')
checkdepends=('cppunit')
backup=("etc/softhsm2.conf")
options=(!libtool !lto)
source=("git+https://github.com/softhsm/SoftHSMv2.git#tag=$pkgver")
sha256sums=('7ac7a5bbeedc0948600228df80a4381452c0eb812b36fc17da2d7064f273e8b5')

prepare() {
  cd "$srcdir/SoftHSMv2"
  sed -i 's:^full_libdir=":#full_libdir=":g' configure.ac
  autoreconf -vfi
  sed -i "s:libdir)/@PACKAGE@:libdir):" Makefile.in
}

build() {
  cd "$srcdir/SoftHSMv2"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/pkcs11 \
    --datarootdir=/usr/share \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --with-p11-kit=/usr/share/p11-kit/modules/ \
    --with-migrate \
    --enable-visibility \
    --enable-ecc \
    --enable-eddsa \
    --disable-gost
  make
}

check() {
  cd "$srcdir/SoftHSMv2"
  make check
}

package() {
  cd "$srcdir/SoftHSMv2"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/softhsm/LICENSE"
  rm "$pkgdir/etc/softhsm2.conf.sample"

  cd "$pkgdir/usr/lib"
  install -dm0755 softhsm
  ln -s ../pkcs11/libsofthsm2.so softhsm/
  ln -s pkcs11/libsofthsm2.so
}
