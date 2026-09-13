# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=mkdocs-material
pkgver=9.7.7
pkgrel=1
pkgdesc="Documentation that simply works"
arch=(any)
url="https://github.com/squidfunk/mkdocs-material"
license=(ISC)
depends=(
  mkdocs
  python
  python-babel
  python-backrefs
  python-colorama
  python-jinja
  python-markdown
  # python-paginate # Not packaged
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-hatch-nodejs-version
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  'python-cairosvg: for image processing'
  'python-pillow: for image processing'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f78bb465968152fe2d128f1b5cfc6e404466fd3c7f329c31a37c64a334e741107c192a233ae7f5ea2e5ae40edde6b48489192cce3cfa790b336528d14fdd4f89')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
