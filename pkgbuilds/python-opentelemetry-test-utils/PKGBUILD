# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-opentelemetry-test-utils
pkgver=1.44.0
pkgrel=1
pkgdesc="Test utilities for OpenTelemetry unit tests"
arch=('any')
url="https://github.com/open-telemetry/opentelemetry-python/tests/opentelemetry-test-utils"
license=('Apache-2.0')
depends=(
  'python'
  'python-asgiref'
  'python-opentelemetry-api'
  'python-opentelemetry-sdk'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=('python-pytest')
source=("git+https://github.com/open-telemetry/opentelemetry-python.git#tag=v${pkgver}")
sha256sums=('de185f6c14474a3bee91ea09e14bbc41efef7fb9724c0bf98b7600cfdaee7529')

build() {
  cd opentelemetry-python/tests/opentelemetry-test-utils
  python -m build --wheel --no-isolation
}

check() {
  cd opentelemetry-python/tests/opentelemetry-test-utils
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd opentelemetry-python/tests/opentelemetry-test-utils
  python -m installer --destdir="$pkgdir" dist/*.whl
}
