# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Pappa <jcberg@gmail.com >

pkgname=python-xlib
pkgver=0.33
pkgrel=7
pkgdesc="A fully functional X client library for Python programs"
url="https://github.com/python-xlib/python-xlib"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('xorg-xauth' 'xorg-server-xvfb' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-xlib/python-xlib/archive/$pkgver.tar.gz"
        "mock.patch"
        "pkg_resources-fix.patch")
sha256sums=('e10d1b49655800bffe0fbb5eb31eeef915a4421952ef006d468d53d34901f6f8'
            '39d69e698bfd14dce82d36fc5cd5ec8968630df13e3f7425626bdf1bdcbaef4e'
            '3a3bf9815f4280bab67b0bc668bea8ddc9b488a9a2fc90c5baa56163c95c0f50')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "$srcdir/mock.patch"
    patch -Np1 -i ../pkg_resources-fix.patch
}

build(){
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$pkgname-$pkgver"
  xvfb-run pytest -v examples/run_examples.py test/
}

package_python-xlib() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
