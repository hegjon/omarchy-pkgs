# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime
pkgver=1.67
pkgrel=1
pkgdesc="A complete, easy to use date and time object"
arch=('x86_64')
url="https://search.cpan.org/dist/DateTime"
license=('GPL' 'PerlArtistic')
depends=('perl-datetime-timezone>=0.59' 'perl-datetime-locale>=0.41'
	 'perl-params-validate>=0.76' 'perl-math-round'
	 'perl-namespace-autoclean' 'perl-specio' 'perl-eval-closure'
	 'perl-params-validationcompiler')
makedepends=('perl-module-build')
LC_NUMERIC=C
provides=("perl-datetime=`printf %.4f $pkgver`")
options=('!emptydirs')
source=(https://www.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateTime-$pkgver.tar.gz)
sha512sums=('1bc68275a83ae62e69656fa15b93c5b8a9c62551f8bf62e9d36e487e6b33a769849253716b9f991fda374fc209cb0ae3e2356e7d2b3298a73c468966dc3b221c')

build() {
  cd  "$srcdir"/DateTime-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

# TODO: FIXME: FS#58776
_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')

package() {
  cd  "$srcdir"/DateTime-$pkgver
  make install DESTDIR="$pkgdir"
}
