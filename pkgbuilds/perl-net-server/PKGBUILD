# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-net-server
pkgver=2.018
pkgrel=1
pkgdesc='Extensible, general Perl server engine'
arch=(any)
url='https://metacpan.org/release/Net-Server'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(perl)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/B/BB/BBB/Net-Server-$pkgver.tar.gz")
sha512sums=('a7045397431d8f986e755a7abb208ac73c2ec9bd2ea2100a846684bd6afc49a4354d77b02bba8e29f793021c0aa8f3dfd2c5721dadb01b242877a74c3e5171c8')
b2sums=('56d519a3b4da1de843a7dc1ad5de6011d779b57757ce00238d81523c70433bfbc1ddd3b18bdb40443b486305ccd6e072b7951eb762aa4e15755742f5c1bae3d8')

build() {
  cd Net-Server-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Net-Server-$pkgver
  make test
}

package() {
  cd Net-Server-$pkgver
  make install DESTDIR="$pkgdir"
}
