# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=half
pkgver=2.2.1
pkgrel=1
pkgdesc="Half-precision floating-point library"
url="http://half.sourceforge.net/"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.zip::https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.zip/download")
sha256sums=('76ddbf406e9d9b772ec73af2bf925b38b290b4390cc4064720a08d4b4bca0aa9')

package() {
    install -Dm644 "$srcdir/include/half.hpp" "$pkgdir/usr/include/half/half.hpp"
    install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
