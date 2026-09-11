# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-dbd-mysql
pkgver=4.055
pkgrel=1
pkgdesc='Perl/CPAN DBD::mysql module for interacting with MySQL via DBD'
arch=('x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/DBD-mysql/"
depends=('mariadb-libs' 'perl-dbi')
makedepends=('perl-devel-checklib')
checkdepends=('mariadb' 'perl-test-deep')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/D/DV/DVEEDEN/DBD-mysql-${pkgver}.tar.gz)
sha512sums=('4dd86152932ea1e5c13758ecde3f00f992c3f5f81c17631fb5466b796287f9f7b8507810ac109e1996cd07b665233806372787ba1834e5884b1a01daf298a8b9')

build() {
  cd DBD-mysql-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor --testsocket=/tmp/socket.mysql
  make
}

check() {
  cd DBD-mysql-$pkgver
  mkdir -p /tmp/mysql_test
  mysql_install_db \
     --basedir=/usr \
     --datadir=/tmp/mysql_test
  mysqld -P 17999 \
     --socket=/tmp/socket.mysql \
     --datadir=/tmp/mysql_test &
  sleep 10
  DAEMON_PORT=$!
  make test
  kill -9 $DAEMON_PORT
}

package() {
  cd DBD-mysql-$pkgver
  make install DESTDIR="$pkgdir"
}
