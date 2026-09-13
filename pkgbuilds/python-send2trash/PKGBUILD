# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=send2trash
pkgname=python-send2trash
pkgver=2.1.0
pkgrel=1
pkgdesc="Send file to trash natively"
arch=('any')
url="https://github.com/hsoft/send2trash"
license=('BSD')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hsoft/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('7503447b1ae6ce211a71b0325acb7455e8397e3cea516043e52b79a5dd8949ee')

build() {
	cd $_pkgbase-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgbase-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
