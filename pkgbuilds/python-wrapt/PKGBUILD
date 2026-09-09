# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-wrapt
pkgver=2.4.0
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://github.com/GrahamDumpleton/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/GrahamDumpleton/wrapt.git#tag=$pkgver")
sha512sums=('4a44edf22d62f7abb37b6a1075ba8b4e33374504c0055ffed568e8b35a2d42a978c4ff53e9f83d9877b647ef02cd89a1f5ddbb9cb85a710916337a5321e98cd0')

build() {
  cd wrapt
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd wrapt
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -k "not mypy"
}

package() {
  cd wrapt
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
