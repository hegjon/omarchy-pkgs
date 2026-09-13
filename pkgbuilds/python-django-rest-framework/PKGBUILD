# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-rest-framework
_name="${pkgname#python-}"
pkgver=3.17.1
pkgrel=1
pkgdesc="A powerful and flexible toolkit for building Web APIs."
arch=(any)
url="https://www.django-rest-framework.org/"
_url="https://github.com/encode/django-rest-framework"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-pytz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-django-filter: for dynamic queryset filters'
  'python-django-guardian: for a per-object permission model'
  'python-markdown: for markdown support'
  'python-psycopg2: for PostgreSQL support'
  'python-pygments: for syntax highlighting'
  'python-yaml: for YAML support'
)
source=(
  $_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('e7fb441b2da25feb3236bf9bbb027d6d22675cde34c7a68b6de488cc7356c84472bdc9f2004ae4b255c8d31bbe92cfb998bf23ba1d847782240c23047f369725')
b2sums=('cea31a42eee7ac19c52fc82891ccb4fdc7a4d1e4cbf218215846f101ae3422e31c12118c7e09727292a756bf60c93b1cd6c8b924b3c18c0c7d4e3873a098f7f0')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""
    -o filterwarnings=""
    --deselect tests/test_fields.py::TestPytzNaiveDayLightSavingTimeTimeZoneDateTimeField::test_invalid_inputs
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
