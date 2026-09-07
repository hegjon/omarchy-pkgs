# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.13.4
pkgrel=1
pkgdesc='POSIX compliant shell that aims to be as small as possible'
url='http://gondor.apana.org.au/~herbert/dash/'
arch=(x86_64)
license=(
  BSD-3-Clause
  GPL-2.0-or-later
)
depends=(
  glibc
  libedit
  libedit.so
)
install=dash.install
source=(
  https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('ff0e8a86097bbc39270e7aec9801997f302212e8c81fd24e9d8895830298041916be00a0cfb7a611845703dad4e2cdf51e9909bfcfadc00d4b82772ee5fed33d')
b2sums=('8555459905a99772830a82c070ce4b1fe1ea8e3a89cf9618505737dce0614cfdafb706e11c82d134fdd6a5150b16ed7a170641cb770625bfc7899d1791430c6d')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make V=1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
