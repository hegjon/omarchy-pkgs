# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-mouse
pkgver=2.6.2
pkgrel=1
pkgdesc="Moose minus the antlers"
arch=('x86_64')
url="https://search.cpan.org/dist/Mouse"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-test-exception' 'perl-test-fatal' 'perl-module-build'
             'perl-module-build-xsutil' 'perl-test-requires'
             'perl-test-leaktrace' 'perl-test-output' 'perl-test-deep'
             'perl-io-string')
checkdepends=('perl-path-class')
source=(https://cpan.metacpan.org/authors/id/S/SY/SYOHEX/Mouse-v$pkgver.tar.gz)
sha512sums=('e28f8e2ce6275ed3ab1e5ee0ee436d6cc3888ef7f752c4aa3d61b6ff97d3486dccbd00f1b5e2b6ac9d16bc8148e7ef27c87097684f68773ce9789878e994065b')

build() {
  cd Mouse-v$pkgver
  perl Build.PL --installdirs=vendor
  ./Build
}

check() {
  cd Mouse-v$pkgver
  ./Build test
}

package() {
  cd Mouse-v$pkgver
  ./Build install --destdir="${pkgdir}"
}
