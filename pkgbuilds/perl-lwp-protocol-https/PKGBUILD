# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=perl-lwp-protocol-https
pkgver=6.17
pkgrel=1
pkgdesc="Provide https support for LWP::UserAgent"
arch=('any')
url="https://metacpan.org/release/LWP-Protocol-https"
license=('PerlArtistic' 'GPL')
depends=('ca-certificates' 'perl-io-socket-ssl' 'perl-net-http' 'perl-libwww')
checkdepends=('perl-test-needs')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/LWP-Protocol-https-$pkgver.tar.gz")
sha512sums=('5703129feddb4d6798f16d97a2b5148c2afce244be7961fc8f4ee19bb7a0c79f750aa69da574ac6e245133246152863ad42b32cfeb55d7da48a7ebb12b34c5ef')

build() {
  cd LWP-Protocol-https-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd LWP-Protocol-https-$pkgver
  make test
}

package() {
  cd LWP-Protocol-https-$pkgver
  make DESTDIR="$pkgdir" install
}
