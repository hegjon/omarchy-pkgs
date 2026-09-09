# Maintainer: David Runge <dvzrv@archlinux.org>

_bootstrap=0
_bootstrap_version=3.14.0
_parent_name=flit
_name=flit_core
pkgname=python-flit-core
pkgver=4.0.2
pkgrel=1
pkgdesc="A PEP 517 build backend for packages using Flit"
arch=(any)
url="https://github.com/pypa/flit/tree/main/flit_core"
_url="https://github.com/pypa/flit"
license=(BSD-3-Clause)
groups=(python-build-backend)
depends=(python)
if (( _bootstrap == 0 )); then
  makedepends=(
    python-build
    python-installer
  )
else
  makedepends=(
    git
  )
fi
checkdepends=(
  python-pytest
  python-testpath
)
if (( _bootstrap == 0 )); then
  source=($_parent_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
else
  source=(
    python-bootstrap::git+https://gitlab.archlinux.org/archlinux/python-bootstrap.git#tag=$_bootstrap_version
    python-build::git+https://github.com/pypa/build.git
    python-flit::git+https://github.com/pypa/flit.git
    python-installer::git+https://github.com/pypa/installer.git
    python-wheel::git+https://github.com/pypa/wheel.git
    python-packaging::git+https://github.com/pypa/packaging
    python-pyproject-hooks::git+https://github.com/pypa/pyproject-hooks
    python-setuptools::git+https://github.com/pypa/setuptools.git
  )
fi
sha512sums=('10086861c59047fad5b02b39b527f3e805bf93ea21d66879ce67743ab04fca4021b491963d89590821806c3747baccdc697f953a27ef50f0608eb0519f8a6909')
b2sums=('3b4311285053abb6202bc9664cf03a5486dbc1318bde6817074c895b680f2cb8ebdad79b3990a3a40e834e496ecb67144ed8e92116a3b2441e65928016becee2')

prepare() {
  if (( _bootstrap == 0 )); then
    cd $_parent_name-$pkgver
  else
    cd python-bootstrap
    git submodule init

    git config submodule."external/build".url ../python-build
    git config submodule."external/flit".url ../python-flit
    git config submodule."external/installer".url ../python-installer
    git config submodule."external/wheel".url ../python-wheel
    git config submodule."external/packaging".url ../python-packaging
    git config submodule."external/pyproject-hooks".url ../python-pyproject-hooks
    git config submodule."external/setuptools".url ../python-setuptools

    git -c protocol.file.allow=always submodule update
    git submodule update --init --recursive
  fi
}

build() {
  if (( _bootstrap == 0 )); then
    cd $_parent_name-$pkgver/$_name
    python -m build --wheel --skip-dependency-check --no-isolation
  else
    cd python-bootstrap
    python -m bootstrap.build
  fi
}

check() {
  cd $_parent_name-$pkgver/$_name
  pytest -vv
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  if (( _bootstrap == 0 )); then
    cd $_parent_name-$pkgver/$_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  else
    cd python-bootstrap
    python -m bootstrap.install dist/flit_core-*-py3-none-any.whl -d "$pkgdir"
    install -vDm 644 external/flit/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi

  # remove tests
  rm -frv "$pkgdir/$site_packages/${_name/-/_}/tests/"
  # remove vendored tomli
  rm -frv "$pkgdir/$site_packages/${_name/-/_}/vendor/"
}
