# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python-sqlalchemy
_name="${pkgname#python-}"
pkgver=2.0.51
_ver="rel_${pkgver//./_}"
pkgrel=1
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('glibc' 'python' 'python-greenlet' 'python-typing_extensions')  # HACK: typing_extensions is not required but upstream unconditionally imports it
optdepends=('python-psycopg: connect to PostgreSQL database'
            'python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cython')
checkdepends=('python-pytest' 'python-pytest-xdist' 'mypy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlalchemy/sqlalchemy/archive/refs/tags/${_ver}.tar.gz")
# https://github.com/sqlalchemy/sqlalchemy/discussions/11138
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('218427cd4441c30f4b3f4d23c8f5ec5754aa288fea117de198e89f028f8209aeea2acfb47428cbfc4bcf423a65df9f28d7c7e7afa740bc3d8a0668a3e58c712c')

prepare() {
  cd $_name-$_ver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py

  # strip dev for https://gitlab.archlinux.org/archlinux/packaging/packages/python-sqlalchemy/-/issues/1
  sed -i '/tag-build = "dev"/d' pyproject.toml
  sed -i '/tag_build = dev/d' setup.cfg
}

build() {
  cd $_name-$_ver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$_ver
  PYTHONPATH=build/lib pytest
}

package() {
  cd $_name-$_ver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 ft=sh et:
