# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-sphinx-book-theme
pkgver=1.4.0
pkgrel=1
pkgdesc='A clean book theme for scientific explanations and documentation with Sphinx'
arch=('any')
url="https://github.com/executablebooks/sphinx-book-theme"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-docutils'
  'python-pydata-sphinx-theme'
  'python-sphinx'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx-theme-builder'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-regressions'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('504ab2f81ffeea61d8c0d7ff0ad2c7959024debd022e41531d082e3c5019f1dbe64cbb540c81d1db87afd9889a1ac0898ed2b5a7884e9df85dc045754711167b')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Other tests require python-myst-nb which is not in the repos.
  test-env/bin/python -m pytest tests/test_locale_convert.py
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
