# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-cryptography
pkgver=50.0.1
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
url="https://github.com/pyca/cryptography"
license=('Apache-2.0' 'BSD-3-Clause')
depends=(
  'glibc'
  'libgcc'
  'openssl'
  'python'
  'python-cffi'
)
makedepends=(
  'clang'
  'git'
  'lld'
  'llvm'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-certifi'
  'python-hypothesis'
  'python-pretend'
  'python-pytest'
)
source=(
  "git+https://github.com/pyca/cryptography.git#tag=$pkgver"
)
b2sums=('e44a6be4acb58b27f00596eb866e2bb075c656e99bc9e184034a4a9ee67ee6e0400b8028ccb565415ef5790b5f0294b619383e675585b0c4f663f9f6cd7573cb')

prepare() {
  cd cryptography
  # Drop all benchmark tests, this means we don't have to checkdepends on
  # pytest-benchmark nor are benchmark tests interesting for a distribution.
  rm -rf tests/bench
}

build() {
  cd cryptography
  echo "$RUSTFLAGS"
  # https://github.com/pyca/cryptography/issues/9023
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    python -m build --wheel --no-isolation
}

check() {
  cd cryptography
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir="tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PWD/vectors" \
    pytest --override-ini="addopts=" tests
}

package() {
  cd cryptography
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.BSD
}
