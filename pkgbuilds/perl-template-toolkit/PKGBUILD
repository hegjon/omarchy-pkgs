# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom Killian <tomk@runbox.com>
# Contributor: FJ <joostef@gmail.com>

pkgname=perl-template-toolkit
pkgver=3.106
pkgrel=1
pkgdesc="Perl template processing system"
arch=('x86_64')
url="https://metacpan.org/release/Template-Toolkit"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl-appconfig' 'perl')
checkdepends=('perl-image-info' 'perl-test-leaktrace')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/T/TO/TODDR/Template-Toolkit-$pkgver.tar.gz)
sha512sums=('a94bd16aa20050096d3828779dbe9329e5949f516c90cb486ad96024d0b9bc35b97e7fb9206e19ad64a4ccb71485607308fede3fb5e1da2180a55d66cdbc7ca8')

build() {
  cd Template-Toolkit-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor TT_ACCEPT=y
  make
}

check() {
  cd Template-Toolkit-$pkgver
  make test
}

package() {
  cd Template-Toolkit-$pkgver
  make install DESTDIR="${pkgdir}"
}
