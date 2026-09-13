# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-authen-sasl
pkgver=2.2100
pkgrel=1
pkgdesc="Perl/CPAN Module Authen::SASL : SASL authentication framework"
arch=(any)
url="https://search.cpan.org/dist/Authen-SASL"
license=("GPL" "PerlArtistic")
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('4f0f100aeed34b52977a94b7df973e7f0b8f92d167b09f2b249bab81e8590e57')
options=(!emptydirs)

build() {
  cd "$srcdir"/Authen-SASL-$pkgver
  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Authen-SASL-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
}
