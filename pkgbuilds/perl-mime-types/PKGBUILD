# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
pkgver=2.30
pkgrel=1
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=('any')
url="https://search.cpan.org/dist/MIME-Types/"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-$pkgver.tar.gz")
sha512sums=('6715b937d72763bef16685e39dd5848cd5ce7fd2e37c05cea847d62b598cc19a2dd38168c8c2bedf2879e43c1e118f1a6744e040594719c9fcb1b43968be9bdd')

build() {
  cd MIME-Types-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MIME-Types-$pkgver
  make test
}

package() {
  cd MIME-Types-$pkgver
  make DESTDIR="${pkgdir}" install
}
