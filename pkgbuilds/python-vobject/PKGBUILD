# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
_name=${pkgname#python-}
pkgver=0.9.9
pkgrel=3
pkgdesc='Module for parsing and generating vCard and vCalendar files'
arch=(any)
url=http://py-vobject.github.io
license=(Apache-2.0)
depends=(
  python
  python-dateutil
  python-pytz
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "git+https://github.com/py-vobject/vobject.git#tag=v$pkgver"
  0001-remove-six.patch
)
b2sums=('59b95bd5120aa8ef85a8394aa665271a0e3fc9c73dcf06d2df8c40984eef256166d96e4bd51aede90f2fee0d4328a6c3b64357f6c8c1c3a8caad407cc7f5fd64'
        '37436e090724fbe77be2524fa7285d4e4fd631f7fa71834925167f0b5ad63e86913c203c0d3487ab3f88998066e8ae1d07ea6bcd4b124b180eb21302495eed70')

prepare() {
  cd "$_name"
  patch --forward --strip=1 --input=../0001-remove-six.patch
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  python tests.py
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {ACKNOWLEDGEMENTS.txt,README.md} \
    -t "$pkgdir"/usr/share/$pkgname
}
