# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=8.6
pkgrel=1
pkgdesc='Zope Interfaces for Python 3.x'
arch=('x86_64')
url="https://github.com/zopefoundation/zope.interface"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-event'
  'python-zope-testing'
)
makedepends+=(git)
source=("git+https://github.com/zopefoundation/zope.interface.git#tag=$pkgver")
sha512sums=('f41c9f41c55e4cceaa507c02f49d9f115b1a868ccca7fb3e868aea82bd4de268ce96cc42a48e81ff1f53300312f7d9c01ce3467ab8ffb2c9602d55b8fe2b8d50')

build() {
  cd zope.interface
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd zope.interface
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd zope.interface
  python -m installer --destdir="$pkgdir" dist/*.whl
}
