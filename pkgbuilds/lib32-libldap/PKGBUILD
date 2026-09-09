# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgbasename=libldap
pkgname=lib32-$_pkgbasename
pkgver=2.6.13
pkgrel=1
pkgdesc="Lightweight Directory Access Protocol (LDAP) client libraries (32-bit)"
arch=('x86_64')
license=('LicenseRef-OpenLDAP')
url="https://www.openldap.org/"
depends=('lib32-openssl' 'lib32-libxcrypt' $_pkgbasename)
makedepends=(gcc-multilib)
source=(https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz{,.asc})
sha256sums=('d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656'
            'SKIP')
validpgpkeys=('3CE269B5398BC8B785645E987F67D5FD1CE1CBCE') # OpenLDAP Project <project@openldap.org> https://www.openldap.org/software/download/OpenLDAP/gpg-pubkey.txt

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd openldap-${pkgver}

  ./configure --prefix=/usr \
              --libexecdir=/usr/sbin \
              --sysconfdir=/etc \
	      --mandir=/usr/share/man \
              --localstatedir=/var/lib/openldap \
              --enable-crypt --enable-dynamic \
              --with-threads --disable-wrappers \
	      --disable-spasswd --without-cyrus-sasl \
	      --disable-bdb --disable-hdb --libdir=/usr/lib32

  make -C include
  make -C libraries
}

package() {
  cd openldap-${pkgver}

  make -C include DESTDIR="${pkgdir}" install
  make -C libraries DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin} "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
