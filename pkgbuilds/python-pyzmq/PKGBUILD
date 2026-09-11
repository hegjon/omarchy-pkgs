# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd at gmail dot com>

pkgname=python-pyzmq
pkgver=27.2.0
pkgrel=1
pkgdesc='Python bindings for ZeroMQ'
arch=(x86_64)
url='https://zeromq.org/languages/python/'
license=(BSD-3-Clause)
depends=(zeromq python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-scikit-build-core
  python-wheel
  cython
)
source=("$pkgname::git+https://github.com/zeromq/pyzmq#tag=v$pkgver")
sha512sums=('4533e04dedf8cf03460902cb9cdf8ad3589366d2f7d6b527af3aaba00cc89d5bb91b5c8721fad453a5c53697678d5d2f5ed2b244b12c371bec6d7cd0f875a910')
b2sums=('e5a595187e79458615814cfa7090bc0c9f4cecfa201799ab8cba271d575057275f6da74e6f878db3747d0ca3666a67c831d8c7a564e4cf15ec49e2180739b1d5')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
