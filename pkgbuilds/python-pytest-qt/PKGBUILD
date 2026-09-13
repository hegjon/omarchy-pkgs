# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=pytest_qt
pkgname=python-pytest-qt
pkgver=4.5.0
pkgrel=1
pkgdesc='pytest support for PyQt and PySide applications'
arch=(any)
license=('MIT')
url='https://github.com/pytest-dev/pytest-qt'
depends=('python-pytest')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer')
checkdepends=('python-pyqt6')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('84b4789e3017dfbbc0c36658bb36d175055cf2354612833aae91441e803457142d412edbe74823f916ac1cccb73efc87ed73b776a8b18cf71d66497514edc5cd')

build() {
  cd ${_name}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${_name}-$pkgver/src
  PYTHONPATH="$PWD" PYTEST_QT_API=pyqt6 QT_QPA_PLATFORM='offscreen' pytest --fixtures pytestqt ../tests
}

package() {
  cd ${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
