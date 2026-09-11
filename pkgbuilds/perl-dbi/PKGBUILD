# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.653
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="https://metacpan.org/release/DBI"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tgz")
sha512sums=('ed646a428df291cc087cf70e313971c66de9352a5094bf826d72d00e72fa5e600032bcccea14a7362a62cea26b9128cad6e4a1e27483d19a0f1d7eb247c3119a')

build() {
  cd DBI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd DBI-$pkgver
  make test
}

package() {
  cd DBI-$pkgver
  make DESTDIR="$pkgdir" install
}
