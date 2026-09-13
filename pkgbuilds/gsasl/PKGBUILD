# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl
pkgver=2.2.4
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms"
arch=('x86_64')
url="https://www.gnu.org/software/$pkgname/"
license=('LGPL-2.1-or-later AND GPL-3.0-or-later AND GFDL-1.3-or-later')
depends=('gnutls' 'libidn' 'krb5')
source=(https://ftp.gnu.org/gnu/gsasl/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('1ff282a2a4a21b9c8f5ff933410015be8bd8d2c68aca90a7517622616481e4f7512a1879b488e7bf31e97d8280024d3051b3fc257479c895a9dd3eae7899616e'
            'SKIP')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE'   # Simon Josefsson <simon@josefsson.org>
              '9AA9BDB11BB1B99A21285A330664A76954265E8C')  # Simon Josefsson <simon@josefsson.org>
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gssapi-impl=mit
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
