# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgname=safeint
pkgver=3.0.28
pkgrel=1
pkgdesc="class library for C++ that manages integer overflows"
arch=("any")
url="https://github.com/dcleblanc/SafeInt"
license=("MIT")
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d6b164bcea92a746e4d44132e505c7ab1816d1089ba99ebc674ccd4b70262ed5')

package() {
	cd SafeInt-${pkgver}
	local _header
	for _header in SafeInt.hpp safe_math.h safe_math_impl.h; do
		install -vDm644 ${_header} "${pkgdir}"/usr/include/${_header}
	done
	install -vDm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
