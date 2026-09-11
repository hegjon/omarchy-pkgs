# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-scikit-build-core
pkgver=1.0.3
pkgrel=1
pkgdesc='Next generation Python CMake adaptor and Python API for plugins'
arch=(any)
url='https://github.com/scikit-build/scikit-build-core'
license=(Apache-2.0)
depends=(
  cmake
  ninja
  python
  python-packaging
  python-pathspec
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  pybind11
  python-cattrs
  python-fastjsonschema
  python-hatch-fancy-pypi-readme
  python-numpy
  python-pytest
  python-pytest-subprocess
  python-setuptools-scm
  python-typing_extensions
  python-validate-pyproject
  python-virtualenv
)
source=("$url/archive/v$pkgver/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('89ba46880bc37fa90b6d9ef637c6550b94e7fe64074c5675ff6d0a0a1f4e99a99f08b13b1bb39da725964e50f4d53bdaf441c8e30f351176ca08e252e31a488f')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: upstream hardcodes downloading the internet with pip:
# https://github.com/scikit-build/scikit-build-core/issues/720
check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not network' \
    --ignore=tests/test_editable.py \
    --ignore=tests/test_editable_generated.py \
    --ignore=tests/test_pyproject_pep660.py
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
