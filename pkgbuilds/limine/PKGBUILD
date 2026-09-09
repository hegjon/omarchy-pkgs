# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
_pkgname=Limine
pkgver=12.8.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://github.com/Limine-Bootloader/Limine"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
install="${pkgname}.install"
source=("git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('eececf13a9dc72037cf58dc65d2a7f792323d2b39239556c342a0658fb221625')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821'  # Mintsuki <mintsuki@protonmail.com>
              '6C222EA6B2BD216AA406516AC868F0B6DE38409D') # Kamila Szewczyk <k@iczelia.net>

prepare() {
	cd "${_pkgname}"
	./bootstrap
}

build() {
	cd "${_pkgname}"
	./configure --prefix=/usr --enable-all
	make
}

package() {
	cd "${_pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
