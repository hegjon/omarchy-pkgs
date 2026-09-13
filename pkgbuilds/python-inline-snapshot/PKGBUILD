# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-inline-snapshot
pkgver=0.32.6
pkgrel=1
pkgdesc="Create and update inline snapshots in your python tests"
arch=(any)
url="https://github.com/15r10nk/inline-snapshot"
license=(MIT)
depends=(
  python
  python-asttokens
  python-executing
  python-pytest
  python-rich
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-black
  python-dirty-equals
  python-hypothesis
  python-isort
  python-pydantic
  python-pytest-freezer
  python-pytest-mock
  python-pytest-subtests
  python-pytest-xdist
  python-time-machine
)
optdepends=(
  'python-black: retains black formatting'
  'python-dirty-equals: snapshot comparison using dirty-equals'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7e0c42b3037c25fe237a6f2cb888e970b21ecabe8269731a0c3dd402611e81aa')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest \
    --deselect tests/test_formating.py::test_format_command_fail \
    --deselect tests/test_typing.py
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
