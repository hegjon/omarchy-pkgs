# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-crispy-forms
pkgname=python-django-crispy-forms
pkgver=2.7
pkgrel=1
pkgdesc="The best way to have DRY Django forms"
arch=(any)
url="https://github.com/django-crispy-forms/django-crispy-forms"
license=(MIT)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-crispy-bootstrap3
  python-crispy-bootstrap4
  python-crispy-bootstrap5
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-crispy-bootstrap3: for a bootstrap 3 theme pack'
  'python-crispy-bootstrap4: for a bootstrap 4 theme pack'
  'python-crispy-bootstrap5: for a bootstrap 5 theme pack'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('77f662422b412b9cb10a9b9726e63064679c3772031051fd6a1e23e98a5740b13e7198f8068e780b2b4d2eecc470ac4247e80a57be4a81937d3e11d1528f5dc5')
b2sums=('451c87cb3bd80d4c2a67997c4506651f2f60b9d281114b0d7544fa0e1fa889dcd2aed20b6026359d525f9e1e40495007c2ab6c3a35cac77ad81f40e80838dd7e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PWD:$PYTHONPATH"
  DJANGO_SETTINGS_MODULE=tests.test_settings pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CONTRIBUTORS.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
