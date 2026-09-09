# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.20.0
pkgrel=1
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11 python-cmake-build-extension)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1fc2d0acfcc8daf03f456de0f6da508fbf17e29b82a634df28035cc713cbb5262d8899a7bec6d9fd30a04e4927eba72af88de78ae8306050ed850905b030f290')
b2sums=('6987427051001cf297345a26be882d07cb4f5defed0b35c8047d8dcd1983c14c0c1ee29faa2b840a353d26c6a26077e5d0e01a4b4437eef29a96cdb2e6c20d51')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
