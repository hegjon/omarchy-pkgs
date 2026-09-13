# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=intelhex
pkgname=python-$_pkgname
pkgver=2.3.0
pkgrel=9
pkgdesc='Python library for Intel HEX files manipulations'
arch=('any')
url='https://github.com/python-intelhex/intelhex'
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('bf9a7e29641959e26d8ac2ae2702ed5f4f0003f45793b70cd4cd99454d25304b90749e91a73a794a8363e4bc948ba91f274fc9c448567090c581d91f043f4ee9')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python -m unittest -v
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
