# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.46.5
pkgrel=1
epoch=3
pkgdesc="Core validation logic for pydantic written in rust "
arch=(x86_64)
url="https://github.com/pydantic/pydantic-core"
license=(MIT)
depends=(
  glibc
  libgcc
  python
  python-typing-inspection
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-dirty-equals
  python-hypothesis
  python-inline-snapshot
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-run-parallel
  python-pytest-timeout
)
options=(!lto)
source=(
    "pydantic::git+https://github.com/pydantic/pydantic.git#tag=core-v${pkgver}"
)

sha512sums=('77adaf98c0f22d7fd21b3f2dfe500293c8c12ae1c11a193daf912af8c3b25862387d9e36f1ca00109a008401afec216a437bfefe37dce1ffe2247d71f9c7cd4f')
b2sums=('dd04858c892929e0ed32738d7f44f3c382bceb2d51c4baa3b84aa06ea4cef9bac9a708ebbc63eeaf286e43879f14302ce298d97aed551ad9146679cc041b6cbd')

build() {
  cd "pydantic/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "pydantic/$_name"
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  HYPOTHESIS_PROFILE=slow pytest "${pytest_options[@]}"
}

package() {
  cd "pydantic/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
