# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-nbval
pkgver=0.11.0
pkgrel=4
pkgdesc="A py.test plugin to validate Jupyter notebooks"
url="https://github.com/computationalmodelling/nbval"
license=('BSD-3-Clause')
arch=('any')
depends=('python-pytest' 'python-jupyter_client' 'jupyter-nbformat' 'python-ipykernel'
         'python-coverage')
makedepends=('git' 'python-build' 'python-nbdime' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-matplotlib' 'python-pytest' 'python-pytest-mock' 'python-sympy')
optdepends=(
  'python-nbdime: for --nbdime option'
)
source=("git+https://github.com/computationalmodelling/nbval.git#tag=$pkgver")
sha512sums=('0649b958eda9f21108a3647da60d54047101bab8035f4663e7da6aaefa58c8b67ae58852c492b5c11c2541251c21eed98932e1ad0d2ef974a4ce518f1f2f12ff')

build() {
  cd nbval
  python -m build --wheel --no-isolation
}

check() {
  cd nbval
  python -m venv --system-site-packages test_env
  test_env/bin/python -m installer dist/*.whl
  # https://github.com/computationalmodelling/nbval/blob/0.10.0/dodo.py#L25
  PYTHONPATH="$PWD" test_env/bin/python -m pytest -v tests/ --nbval --nbval-current-env --nbval-sanitize-with tests/sanitize_defaults.cfg --ignore tests/ipynb-test-samples --deselect tests/test_coverage.py
}

package() {
  cd nbval
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
