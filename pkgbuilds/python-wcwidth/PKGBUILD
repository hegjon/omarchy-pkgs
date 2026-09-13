# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.8.3
pkgrel=1
pkgdesc='Python library that measures the width of unicode strings rendered to a terminal'
arch=(any)
url='https://github.com/jquast/wcwidth'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('03cd19e599201a6215158ac63a65201b1987a5e73df2a3441e7ef93582c035722c1855ede17b69e99832ff49e64df37b94ce3420a69c45d7793edab999fb00d2')
b2sums=('279d01c6b07379c11f93597d5ffb67dbf0efe58af622a0fd714aaef5d328091792c200d32b6ea360ff5d81bd0b79b9de7e9831646139b5bd5ae9bb5443d34027')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  rm -v tox.ini

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
