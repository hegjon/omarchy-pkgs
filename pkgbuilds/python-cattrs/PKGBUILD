# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-cattrs
pkgver=26.2.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url='https://catt.rs'
_url='https://github.com/python-attrs/cattrs'
license=(MIT)
depends=(
  python
  python-attrs
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-msgspec
  python-orjson
  python-pytest
  python-pytest-benchmark
  python-yaml
)
optdepends=(
  'python-msgspec: msgspec converter'
  'python-orjson: orjson converter'
  'python-yaml: YAML converter'
)
source=("git+$_url#tag=v$pkgver")
b2sums=('b4c4a6d1c383c40e01d647ba46d46bbabe9bc5c025cfaa977065dc36b851727106dd3f83f50d00947257d2cb25b781f317893af45710439cfbe1c1c2e66ec20a')

build() {
  cd "${pkgname#python-}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests depend on currently unpackaged python-immutables,
  # python-bson, python-msgspec.
  test-env/bin/python -m pytest --override-ini="addopts=" \
    --ignore=tests/preconf/test_msgspec_cpython.py \
    --ignore=tests/preconf/test_pyyaml.py \
    --ignore=tests/test_cols.py \
    --ignore=tests/test_preconf.py \
    --ignore=tests/test_unstructure_collections.py
}

package() {
  cd "${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
