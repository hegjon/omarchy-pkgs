# Maintainer: David Runge <dvzrv@archlinux.org>

_name=dirty-equals
pkgname=python-dirty-equals
pkgver=0.11.0
pkgrel=2
pkgdesc="Doing dirty (but extremely useful) things with equals"
arch=(any)
url="https://github.com/samuelcolvin/dirty-equals"
license=(MIT)
depends=(
  python
  python-pytz
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-packaging
  python-pydantic
  python-pytest
  python-pytest-examples
  python-pytest-mock
)
optdepends=(
  'python-pydantic: for pydantic support'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('eb4e8725305dbe60b76171d7c4ad4c11ccf9d882e8b4adab7fd9937e580abae512e83e8f0691935c483e727b60c2f8d4881e03e15e74376c52556817f5db83b5')
b2sums=('cf1c644c257a9f7ed93e297b2e2b4f868d9b7d62697cd76aefb8f21684333932ac06bb23dec18a604934312c362b7bbc8117aff96cc50c492ae393d24b751f02')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  # tests require UTC timezone: https://github.com/samuelcolvin/dirty-equals/issues/33
  TZ=UTC pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
