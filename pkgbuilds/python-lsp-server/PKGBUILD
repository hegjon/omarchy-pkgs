# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Platon Pronko <platon7pronko@gmail.com>

pkgname=python-lsp-server
pkgver=1.15.0
pkgrel=1
pkgdesc="Fork of the python-language-server project, maintained by the Spyder IDE team and the community"
arch=(any)
url="https://github.com/python-lsp/python-lsp-server"
license=(MIT)
depends=(
    python-black
    python-jedi
    python-lsp-jsonrpc
    python-pluggy
    python-ujson
    python-websockets
    python-docstring-to-markdown
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
optdepends=(
    'python-mccabe: complexity checking'
    'python-pycodestyle: linter - style checking'
    'python-pydocstyle: linter - docstring style checking'
    'python-pyflakes: linter to detect various errors'
    'python-pylint: code linting'
    'python-rope: for completions and renaming'
    'autopep8: code formatting'
    'flake8: error checking'
    'yapf: code formatting (preferred)'
    'python-whatthepatch: required for yapf support'
)
checkdepends=(
    python-pytest
    python-flaky
    python-mccabe
    python-pycodestyle
    python-pydocstyle
    python-pyflakes
    python-pylint
    python-rope
    autopep8
    flake8
    yapf
    python-whatthepatch
    python-matplotlib
    python-numpy
    python-pandas
    python-pyqt6
    python-appdirs
)
source=(https://github.com/python-lsp/python-lsp-server/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('262a90a8618125a746b904aa97491f0469324343257135bbadc4a4fe6d07fd34cce4cacbf6c4920dbb419223b20de15dbcaeea79ea78c1dd5c3e3b95eb2a8c1b')

prepare() {
  cd $pkgname-$pkgver
  sed 's|jedi>=[0-9.]\+,<[0-9.]\+|jedi|' -i pyproject.toml
}

build() {
  cd $pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    -W ignore::DeprecationWarning
    --deselect test/plugins/test_completion.py::test_pyqt_completion
    --deselect test/test_language_server.py::test_missing_message
  )

  cd $pkgname-$pkgver
  python -m pytest "${pytest_options[@]}"
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
