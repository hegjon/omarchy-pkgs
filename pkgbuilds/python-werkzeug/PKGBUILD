# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

pkgname=python-werkzeug
pkgver=3.1.8
pkgrel=1
pkgdesc='Swiss Army knife of Python web development'
url='https://werkzeug.palletsprojects.com/'
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-markupsafe'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=(
  'python-cryptography'
  'python-ephemeral-port-reserve'
  'python-greenlet'
  'python-pytest'
  'python-pytest-timeout'
  'python-pytest-xprocess'
  'python-requests'
  'python-watchdog'
)
optdepends=('python-watchdog: faster and more advanced reloader')
source=("git+https://github.com/pallets/werkzeug.git#tag=${pkgver}")
sha512sums=('e0f8e867cd1c4b4d72e9a9af29817b5036449e8f5b0d62414c3386cf29fe65fa7b2a16db776e241009e3bf409a9accc955a27b03373ef3b57a97b7457a2726fe')

build() {
  cd werkzeug
  python -m build --wheel --no-isolation
}

check() {
  cd werkzeug
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd werkzeug
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
