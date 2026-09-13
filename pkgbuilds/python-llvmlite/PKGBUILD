# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

_name=llvmlite
pkgname=python-$_name
pkgver=0.49.0
pkgrel=1
pkgdesc="A lightweight LLVM Python binding for writing JIT compilers"
arch=(x86_64)
url="https://github.com/numba/llvmlite"
license=("BSD-2-Clause AND Apache-2.0 WITH LLVM-exception")
depends=(
    glibc
    libgcc
    libstdc++
    llvm-libs
    python
)
makedepends=(
    cmake
    git
    llvm
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
)
source=(git+https://github.com/numba/llvmlite.git#tag=v$pkgver)
b2sums=('9a46ebc71dc74aa206f79b23dbacb3de3ba564776fc92e88b4cf43c4e18f9a29bcad80bd5bb4b024e5410da4596f3c44b069ba9a85be2ef9d8ab5028cf409db7')

build() {
    cd $_name
    LLVMLITE_SHARED=ON python -m build --wheel --no-isolation
}

check() {
    cd $_name
    pytest -vv $_name/tests
}

package() {
    cd $_name

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -vDm 644 LICENSE LICENSE.thirdparty -t "$pkgdir"/usr/share/licenses/$pkgname/
}
