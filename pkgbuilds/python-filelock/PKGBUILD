# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-filelock
pkgver=3.31.2
pkgrel=1
pkgdesc="A platform-independent file lock"
arch=('any')
url="https://github.com/tox-dev/filelock"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-coverage'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
  'python-pytest-randomly'
  'python-pytest-timeout'
  'python-virtualenv'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('8bea4a3aa4ec79562d933f5065e1481fd74cdb0728aa068e2235030c30503ea6f1a94bf70f748d1d95f2fd7a7d723b6899b3857ac1c2c2d3aae08588d8b05c28')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -W ignore::DeprecationWarning
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
