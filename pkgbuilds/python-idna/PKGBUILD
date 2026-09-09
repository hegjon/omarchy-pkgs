# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.19
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-hypothesis')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('2cdb8cd36879905591e1fd2606d382c408d2f6dba34958a1d2fb58ad2815da4ec6ba62b1d5aefbca9e0cde62a9eb995c7e2885cca75d0bd33986c6341603bb21')

build() {
   cd idna
   python -m build --no-isolation --wheel
}

check() {
   cd idna
   pytest
}

package() {
   cd idna
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
