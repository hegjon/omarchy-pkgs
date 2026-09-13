# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-i18nmessageid
_pkgname=zope.i18nmessageid
pkgver=8.3
pkgrel=1
pkgdesc="Message Identifiers for internationalization"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.i18nmessageid"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-zope-testrunner')
source=("git+https://github.com/zopefoundation/zope.i18nmessageid.git#tag=$pkgver")
sha512sums=('d0e65b187e752d80c9ce30d98742f38ef7de857f1eb5f83a700d53a57de208a90ed9da37fda94db53b503687319147f8af387687a724e62ccbbd13f92c676ebf')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
