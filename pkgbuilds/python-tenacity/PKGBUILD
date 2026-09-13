# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tenacity
pkgver=9.2.0
pkgrel=1
pkgdesc='Retry code until it succeeeds'
arch=('any')
license=('Apache-2.0')
url='https://github.com/jd/tenacity'
depends=('python')
optdepends=('python-tornado: for Tornado coroutines support')
makedepends=('git' 'python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
checkdepends=('python-pytest' 'python-tornado' 'python-trio')
source=("git+https://github.com/jd/tenacity.git#tag=$pkgver")
sha512sums=('943fdd309dd9a581df4e4f588609165b1534b651b1debc7ec8f82005a6b3322fec487b633bd1c206b244ddceb199d074cbbfda6948442c3af9c1ae13a294446c')

build() {
  cd tenacity
  python -m build --wheel --no-isolation
}

check() {
  cd tenacity
  pytest
}

package() {
  cd tenacity
  python -m installer --destdir="$pkgdir" dist/*.whl
}
