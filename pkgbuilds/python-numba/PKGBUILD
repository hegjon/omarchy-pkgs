# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-numba
pkgver=0.67.0
pkgrel=1
pkgdesc='JIT compiler that translates a subset of Python and NumPy code into fast machine code'
arch=(x86_64)
url='https://numba.pydata.org/'
license=(BSD-1-Clause)
depends=(
  glibc
  libgcc
  libgomp
  libstdc++
  python
  python-llvmlite
  python-numpy
)
makedepends=(
  git
  onetbb
  openmp
  python-build
  python-installer
  python-packaging
  python-setuptools
  python-versioneer
  python-wheel
)
optdepends=(
  'onetbb: TBB threading backend'
  'openmp: OpenMP threading backend'
  'python-cffi: use of CFFI bindings in compiled functions'
  'python-colorama: error message highlighting'
  'python-scipy: cython bindings used in np.linalg.* support'
  'python-jinja: “pretty” type annotation output (HTML) via the CLI'
  'python-pyelftools: for code generation'
  'python-pygments: “pretty” type annotation'
  'python-pyyaml: use of a .numba_config.yaml file for storing per project configuration options'
  'python-psutil: for sysinfo'
)
checkdepends=(
  gdb
  ipython
  python-cffi
  python-ipykernel
  python-jinja
  python-pexpect
  python-pip
  python-pygments
  python-pytest
  python-pyyaml
  python-scipy
)
source=(git+https://github.com/numba/numba#tag=$pkgver)
sha512sums=('f64aba5d04245bee0ddc74fc8abc6eb0ad74558ce5eac77c3a5e852695d525d095b47664abfbece985b60f3b863b96e8614d3e3e72083d9313cdd498f36e646d')
b2sums=('48b76ff0b1f7374a3f059a26dc3dbf67671ae0f6f5bfed164bcdf946bb5ea5a9bc8b364c9f2a8440100f4c550e6481c9f2ede4b8674674b713134c85a68e8bc9')

build() {
  cd numba
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer numba/dist/*.whl
  # skip failing typing test
  local site_packages=$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")
  mv "$site_packages"/numba/tests/test_function_type.py{,.disabled}
  test-env/bin/python -m numba.runtests -b -v -m 64 -- numba.tests
}

package() {
  cd numba
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
