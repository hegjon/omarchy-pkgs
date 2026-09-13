# Maintainer: Robin Broda <coderobe @ archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor:  Achilleas Pipinellis <axilleas archlinux gr>

pkgname=supermin
pkgver=5.3.5
pkgrel=2
pkgdesc="Tool for creating supermin appliances"
arch=('x86_64')
url="http://people.redhat.com/~rjones/supermin/"
license=('GPL-2.0-or-later')
depends=(
  'cpio'
  'e2fsprogs'
  'glibc'
  'pacman'
  'pacman-contrib'
)
makedepends=(
  'ocaml'
  'ocaml-findlib'
)
checkdepends=('hivex')
conflicts=('febootstrap<=3.21')
source=("https://download.libguestfs.org/${pkgname}/5.3-development/${pkgname}-${pkgver}.tar.gz"{,.sig} pacman7.1.patch)
sha512sums=('e410bafe06805880f0f701e78d743a6e22e9d25e57bd70a020d583dba6d710ba9917d7afc37be714d9bde410c7ff35f4198300b3af0858d761b0b3e07af58dc0'
            'SKIP'
            '36a01e110f72a0a8b2c5fbf636e6c104286dda9343568bf4c38716207ec95406772a32c1202b6999ecca9cf3c9f2b127e266bd734461272542dd79a2d67f95e8')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0') # Richard W.M. Jones <rjones@redhat.com>

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/pacman7.1.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-network-tests
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # Skip tests requiring kernel and kernel modules - fails in a chroot.
  make check TESTS=" \
    test-basic.sh \
    test-execstack.sh \
    test-binaries-exist.sh \
    test-harder.sh \
  "
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
