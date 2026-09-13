# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-randomly
pkgver=5.0.0
pkgrel=1
pkgdesc='Pytest plugin to randomly order tests and control random.seed'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-randomly'
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-uv-build')
checkdepends=('python-factory-boy' 'python-faker' 'python-numpy' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-randomly.git#tag=$pkgver")
sha512sums=('e3dda448e7b42097c87e13d264c18779ba3024cac6f02415a56b6aaa67ad014d6fb8d30d596947e46f66f6daecd1f5d729bf30806004c9584e0ecd7d6c1d6987')

build() {
  cd pytest-randomly
  python -m build -nw
}

check() {
  cd pytest-randomly
  python -m installer -d tmp_install dist/*.whl
  # tests/test_pytest_randomly.py::{test_model_bakery,test_polyfactory} require unpackaged test dependencies
  # tests/test_pytest_randomly.py::test_entrypoint_injection: TODO
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" \
    pytest --deselect tests/test_pytest_randomly.py::test_model_bakery \
           --deselect tests/test_pytest_randomly.py::test_polyfactory \
           --deselect tests/test_pytest_randomly.py::test_entrypoint_injection
}

package() {
  cd pytest-randomly
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
