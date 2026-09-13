# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-semver
pkgver=3.0.4
pkgrel=2
pkgdesc="Python helper for Semantic Versioning"
url="https://github.com/python-semver/python-semver"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-semver/python-semver.git#tag=$pkgver")
sha512sums=('f8dfb0f49e0f6e1ceea7aa684f4656b2ebea5ba5629722ebfdfc9483c1ba67ca968a6bb9abb91d8e3e2aa7fe0da84311c11f66994b949b4e7365eee173b94db4')

build() {
  cd python-semver
  python -m build -nw
}

check() {
  cd python-semver
  pytest -o addopts=''
}

package() {
  cd python-semver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
