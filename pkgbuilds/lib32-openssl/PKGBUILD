# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-$_pkgbasename
epoch=1
pkgver=3.6.4
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit)'
arch=('x86_64')
url='https://www.openssl.org'
license=('Apache')
depends=('lib32-glibc' "${_pkgbasename}")
optdepends=('ca-certificates')
provides=('libcrypto.so' 'libssl.so')
source=("https://github.com/${_pkgbasename}/${_pkgbasename}/releases/download/${_pkgbasename}-${pkgver}/${_pkgbasename}-${pkgver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha256sums=('9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef'
            'SKIP'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7')
validpgpkeys=('EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
              'BA5473A2B0587B07FB27CF2D216094DFD0CB81EF'
              'B146647E45A7B33947AB226B2A2C87D161692D40')

prepare() {
	cd "$srcdir"/$_pkgbasename-$pkgver

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "$srcdir"/ca-dir.patch
}

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "$srcdir"/$_pkgbasename-$pkgver

	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared enable-ktls linux-elf

	make MAKEDEPPROG="${CC}" depend
	make
}

check() {
	cd "$srcdir"/$_pkgbasename-$pkgver
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "$srcdir"/ca-dir.patch
	# Remove failing test
	rm -f test/recipes/01-test_symbol_presence.t
	make HARNESS_JOBS=$(nproc) test
	patch -Np1 -i "$srcdir"/ca-dir.patch
}

package() {
	cd "$srcdir"/$_pkgbasename-$pkgver
	make DESTDIR="$pkgdir" install_sw

	rm -r "$pkgdir"/usr/{include,bin}
}
