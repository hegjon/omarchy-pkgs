# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
pkgver=8.3
pkgrel=1
pkgdesc="Zope testrunner script"
arch=('any')
url="https://github.com/zopefoundation/zope.testrunner"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-exceptions'
  'python-zope-interface'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# NOTE: Causes circular dependency as python-zope-testing depends on this
# package.
checkdepends=('python-zope-testing')
source=("$pkgname::git+$url.git#tag=$pkgver")
b2sums=('1e87cb410b3bfe2d5ec871916e3203adfbc7cb3148d77c09601971d686fee5e12d3319fecb3ca7640ff7f0a9ef166cad5c84836b0226904d0e8acae89add22d5')

prepare() {
  cd $pkgname
  # Remove test file with invalid Python syntax, breaks installation.
  rm src/zope/testrunner/tests/testrunner-ex/sample2/badsyntax.py
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/zope-testrunner -vc --test-path src/
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
