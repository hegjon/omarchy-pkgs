# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name=mutagen
pkgname=python-mutagen
pkgver=1.48.1
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://github.com/quodlibet/mutagen"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pycodestyle
  python-pyflakes
  python-pytest
)
source=($url/releases/download/release-$pkgver/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('ce19c5752b8d5b5c92de082df9d78c2aae6d1b4b54694416fbc92b6460776b409d1eab0296018f88759bf642b8994c8b0cd67e068afad8193354069b37e29a90'
            'SKIP')
b2sums=('437bd257fcf615e27410678394b2699fe9bfe66156355823d0b18d1975c5e50fc62b09b3ff0cfe9b9c7ea9ca6ca9a00f31ea4a63c1fd0c11da6bb85a55f19896'
        'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter <reiter.christoph@gmail.com>

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v --ignore tests/quality/test_flake8.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
