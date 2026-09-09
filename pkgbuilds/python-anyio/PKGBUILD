# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-anyio
# https://github.com/agronholm/anyio/blob/master/docs/versionhistory.rst
pkgver=4.15.1
pkgrel=1
pkgdesc='High level compatibility layer for multiple asynchronous event loop implementations'
arch=(any)
url='https://github.com/agronholm/anyio'
license=(MIT)
depends=(python python-idna)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm python-wheel
             python-uvloop python-trio)
checkdepends=(python-pytest python-trustme python-hypothesis python-pytest-mock python-psutil
              python-truststore python-pytest-timeout)
optdepends=(
  'python-trio: trio backend'
  'python-outcome: trio backend'
  'python-uvloop: use uvloop for asyncio backend'
  'python-pytest: pytest plugin'
)
source=("git+https://github.com/agronholm/anyio.git#tag=$pkgver")
sha256sums=('016f20cf5256d093cb4537ee2a246b3e39395310add053d9c25ec3cc4c0571a1')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd anyio

  # Remove "error" from pytest filterwarnings
  sed -i '/"error"/d' pyproject.toml

  # pytest 9 validates native TOML types for pytest-timeout settings.
  sed -i 's/timeout = "20"/timeout = 20.0/' pyproject.toml

  # 3 seconds is too short for nested pytest subprocesses on riscv64 builders.
  sed -i 's/timeout=3)/timeout=30)/g' tests/test_pytest_plugin.py
}

build() {
  cd anyio
  python -m build --wheel --no-isolation
}

check() {
  cd anyio
  # Install to a temporary root as the test suite requires the entry point for
  # its pytest plugin
  pyver=$(python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))")
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python$pyver/site-packages" pytest
}

package() {
  cd anyio
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
