# Maintainer: Sébastien Luttringer

pkgname=perl-test-output
pkgver=1.036
pkgrel=3
pkgdesc='Utilities to test STDOUT and STDERR messages'
arch=('any')
license=('GPL' 'PerlArtistic')
depends=('perl-sub-exporter'
  'perl-test-simple'
  'perl-test-pod'
  'perl-test-pod-coverage'
  'perl-capture-tiny')
url='https://search.cpan.org/dist/Test-Output'
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/B/BR/BRIANDFOY/Test-Output-$pkgver.tar.gz")
sha512sums=('b0ede8079146644bac23f772c8f842e0b9b518817327d0d3583b7a04233a6c545137ce85246d24fbe19ee627894c8d3f7d8158e3708f324a5c2c2a13ed1cc0ca')

build() {
  cd Test-Output-$pkgver
  USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Test-Output-$pkgver
  make test
}

package() {
  cd Test-Output-$pkgver
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
