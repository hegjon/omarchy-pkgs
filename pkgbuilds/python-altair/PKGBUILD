# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=altair
pkgname=python-$_name
pkgver=6.2.2
pkgrel=1
pkgdesc="Declarative statistical visualization library for Python"
arch=(any)
url="https://altair-viz.github.io/"
license=(BSD-3-Clause)
depends=(
  python
  python-jinja
  python-jsonschema
  python-narwhals
  python-packaging
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-versioningit
  python-wheel
)
checkdepends=(
  ipython
  python-anywidget
  python-mistune
  python-numpy
  python-pandas
  python-polars
  python-pytest
  python-pytest-xdist
  python-vl-convert
)
optdepends=(
  'python-anywidget: for using JupyterChart widget'
  'python-numpy: for NumPy and Pandas imports'
  'python-pandas: for Pandas imports'
  'python-polars: for Polars imports'
  'python-pyarrow: for PyArrow imports'
  'python-vl-convert: PNG and SVG export via Vega-Lite specifications'
)
source=($_name-$pkgver.tar.gz::https://github.com/vega/altair/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('fea31c7ca8269b79302429363d59384feca8eb408e8a904beb18c507112e2a0be8ed3e5e132b1aa00698643140173f74fc25d27565433da2c9be8118d91d196b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    -m "not slow"
    # skip dataset tests (remote fetching from vega-datasets)
    --deselect tests/test_datasets.py
    # examples are out of sync due to pandas 3 migration, causing the test to fail with pandas 2
    # https://github.com/vega/altair/pull/4010
    --deselect tests/test_examples.py
    # ValueError: Unexpected character found when decoding object value
    --deselect tests/utils/test_schemapi.py::test_chart_validation_errors
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
