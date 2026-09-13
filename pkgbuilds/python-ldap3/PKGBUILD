# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ldap3
pkgver=2.9.1
pkgrel=10
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client library"
url="https://github.com/cannatag/ldap3"
license=('LGPL-3.0-or-later')
arch=('any')
depends=('python-pyasn1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/cannatag/ldap3.git#tag=v$pkgver")
sha512sums=('73715a98d898eda8fc5bfd5d34a825151e97e97112398f83bc580ee1bb35c2ac45488d6923c7d499b8fc1fdbfe75d489eb381911963348b5ebd3a9c98e5d0651')

prepare() {
  cd ldap3
  # Remove test should be run with a server but is not marked as such
  # https://github.com/cannatag/ldap3/issues/1145
  rm test/testLDIF-change.py
}

build() {
  cd ldap3
  python -m build --wheel --no-isolation
}

check() {
  cd ldap3
  export SERVER="NONE"
  python -m unittest discover -vs .
}

package() {
  cd ldap3
  python -m installer --destdir="$pkgdir" dist/*.whl
}
