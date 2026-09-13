# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-opentelemetry-api
pkgver=1.44.0
pkgrel=1
pkgdesc="OpenTelemetry Python API"
arch=('any')
url="https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-api"
license=('Apache-2.0')
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-opentelemetry-test-utils'
  'python-pytest'
)
source=("git+https://github.com/open-telemetry/opentelemetry-python.git#tag=v${pkgver}")
sha256sums=('de185f6c14474a3bee91ea09e14bbc41efef7fb9724c0bf98b7600cfdaee7529')

build() {
  cd opentelemetry-python/opentelemetry-api
  python -m build --wheel --no-isolation
}

check() {
  cd opentelemetry-python/opentelemetry-api
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd opentelemetry-python/opentelemetry-api
  python -m installer --destdir="$pkgdir" dist/*.whl
}
