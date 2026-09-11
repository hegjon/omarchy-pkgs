# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-gevent
pkgver=26.8.0
pkgrel=1
pkgdesc='Python network library that uses greenlet and libenv for easy and scalable concurrency'
arch=(x86_64)
url='http://www.gevent.org'
license=(MIT)
depends=(
  glibc
  c-ares
  libev
  libuv
  python-greenlet
  python-setuptools
  python-zope-event
  python-zope-interface
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  cython
  python-cffi
)
checkdepends=(
  lsof
  python-perf
  python-objgraph
  python-dnspython
  python-requests
)
source=("$pkgname::git+https://github.com/gevent/gevent#tag=$pkgver")
sha512sums=('2685e3793ae51068191bd5c674489b054038b60f775b45859feca2d8590ddce331a206a4e4a514116c4587bcf320e096594863211c0acdb088e75a3a20da4f36')
b2sums=('921c43aa170e827ccf1d93e338f609d5a29dce1081da91d75fb0159a463ecdfbd7a45ea2b7f8908e38ed2349daa72f638a60498b0e05396a609821b3f40d75d1')

build() {
  cd "$pkgname"

  # http://www.gevent.org/development/installing_from_source.html#embedding-libraries
  export GEVENTSETUP_EMBED=0

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m gevent.tests || echo "Tests failed"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
