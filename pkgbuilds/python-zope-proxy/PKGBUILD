# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-proxy
_pkgname=zope.proxy
pkgver=7.3
pkgrel=1
pkgdesc="Generic Transparent Proxies"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.proxy"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-interface'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-security'
  'python-zope-testrunner'
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('835f774ba6926a0a2b62d4aae601d318eca7a67529899eef0374d4b2e59f4d568d5a9e4d25d3acbfa975250857dc9e07e9feb9395125db54fa5730d34453baee')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
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
