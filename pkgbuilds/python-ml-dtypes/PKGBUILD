# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
pkgver=0.6.0
pkgrel=1
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML'
arch=('x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache-2.0' 'MPL-2.0')
depends=('libgcc' 'libstdc++' 'glibc' 'python-numpy')
makedepends=('python-absl' 'python-build' 'python-installer' 'python-pytest' 'git'
             'python-scikit-build-core')
source=("git+https://github.com/jax-ml/ml_dtypes#tag=v$pkgver"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git")
sha256sums=('95ca6f53f138f6923deaaad93af384ff0459daad1225ab0f6a7db1c6087d2ba6'
            'SKIP')

prepare() {
  cd ml_dtypes

  git submodule init

  git config submodule."third_party/eigen".url "${srcdir}/${pkgname}"-eigen

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd ml_dtypes

  python -m build --wheel --no-isolation
}

check() {
  cd ml_dtypes

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=testdir dist/ml_dtypes*.whl
  PYTHONPATH="$PWD/testdir/$site_packages" pytest
}

package() {
  ls -lha ml_dtypes/dist
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    ml_dtypes/dist/ml_dtypes*.whl
}
