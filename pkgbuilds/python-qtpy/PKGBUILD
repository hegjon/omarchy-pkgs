# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=qtpy
pkgname=python-qtpy
pkgver=2.4.3
pkgrel=7
pkgdesc="Provides an uniform layer to support PyQt and PySide with a single codebase"
arch=(any)
url="https://github.com/spyder-ide/qtpy/"
license=(MIT)
depends=(python-packaging
         qt6-python-bindings)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
optdepends=('python-pyqt6-webengine: Qt6-WebEngine python bindings')
# The test suite does not support both stacks at the same time
checkdepends=(
    python-pytest
    python-pytest-qt
    python-pyqt6
    python-pyqt6-3d
    python-pyqt6-datavisualization
    python-pyqt6-webengine
    pyside6
    qt6-multimedia
    qt6-remoteobjects
    qt6-sensors
    qt6-serialport
    qt6-svg
    qt6-tools
    xorg-server-xvfb
)   
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f5885e74adacc5b39a2da5f568d313d1770c6aa5c51b241c10e8d0233e23df15')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  sed -i 's|--cov-report=term-missing --cov-report=xml||' pytest.ini
  PYTHONPATH="${PWD}"/build/lib xvfb-run --auto-servernum pytest qtpy \
    --deselect qtpy/tests/test_qtwebchannel.py \
    --deselect qtpy/tests/test_qtwebsockets.py
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
