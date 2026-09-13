# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-log-log4perl
pkgver=1.58
pkgrel=1
pkgdesc='Log4j implementation for Perl'
arch=('any')
url="https://metacpan.org/release/Log-Log4perl"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSCHILLI/Log-Log4perl-$pkgver.tar.gz")
sha512sums=('c06f19c81fcd377f35812e7ead1ff739030705eeb33357c941cb30dfb75b60716f71f82b7c0e4676df4acf47d840b3bc70ec0dedcb274b75478804d8eabdbc3b')

build() {
  cd Log-Log4perl-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Log-Log4perl-$pkgver
  make test
}

package() {
  cd Log-Log4perl-$pkgver
  make DESTDIR="$pkgdir" install
}
