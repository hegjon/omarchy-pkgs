# Maintainer:

pkgname=python-pytest-tornasync
pkgver=0.6.0.post2
pkgrel=9
pkgdesc='py.test plugin for testing Python 3.5+ Tornado code'
arch=(any)
license=(MIT)
url='https://github.com/eukaryote/pytest-tornasync'
depends=(python
         python-pytest
         python-tornado)
makedepends=(git
             python-build
             python-installer
             python-setuptools)
source=(git+https://github.com/eukaryote/pytest-tornasync#tag=$pkgver)
sha512sums=('d4d9be8b3c8ccbdd8578fc79679b7c9499163be43c232849b991754d1c3da4961862049b47d75bbe503a7a9f7da745bd3a55239a7a3dfdeb592a31b035922df8')

build() {
  cd pytest-tornasync
  python -m build --wheel --no-isolation
}

package() {
  cd pytest-tornasync
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  rm "$pkgdir"/usr/LICENSE
}
