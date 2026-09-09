# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=typing-inspection
pkgname=python-typing-inspection
pkgver=0.4.4
pkgrel=1
pkgdesc="Runtime typing introspection tools"
arch=(any)
url="https://github.com/pydantic/typing-inspection"
license=(MIT)
depends=(
    python
    python-typing_extensions
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
    python-hatchling
)
checkdepends=(
    python-pytest
)
source=("git+https://github.com/pydantic/typing-inspection#tag=v${pkgver}")
sha512sums=('96a4b5ab2fd7f208b5ad6de3dd187a2d9e9338551b9e6efcf51389cb2f173f60736c3bb7d9dd98f230fda7464bc4822e164eb4a72a277a3889a713cc1a16e004')
b2sums=('764428bc994fed4630193476d2e352ba9a0838cd2b516a26acff1eaca5ac99b3c9377ce67bf258238e8a904bb4fb9d543a635a1f996dfdefd1a00cc4b2b98e4b')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir="tmp_install" dist/*.whl
  export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
  pytest -vv -k 'not test_mysql'
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
