# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pymdown-extensions
pkgver=11.0.2
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=(any)
url="https://github.com/facelessuser/pymdown-extensions"
license=(MIT)
depends=(
  python
  python-markdown
  python-yaml
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-pygments
)
optdepends=('python-pygments: for code highlighting')
provides=(pymdown-extensions)
replaces=(pymdown-extensions)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8c8ea86659d3bce060d8882cf1a922d2b0447cf9ac986ec91fce1d111a30641bf71bdf046dfcb638aaea791f2b120213792df9305421207dcb4ef9126f1cd41d')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
