# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.149.16
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('x86_64')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL-2.1-or-later')
depends=('python' 'python-ifaddr')
makedepends=('python-setuptools' 'python-build' 'python-installer'
             'python-wheel' 'python-poetry-core' 'cython')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=($pkgname-$pkgver.tar.gz::https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e4a72f87938ca4cc573ca7f3b6ff02562fb04f0261740f2e05f3efd2759206f0')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgbase}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --override-ini="addopts=" \
    --ignore tests/benchmarks \
    --deselect tests/services/test_types.py::test_integration_with_listener_ipv6
}

package() {
  cd "${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
