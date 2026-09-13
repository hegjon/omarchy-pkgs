# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Emil Lundberg <emil@emlun.se> <emil@yubico.com>

pkgname=python-fido2
pkgver=2.2.1
pkgrel=1
pkgdesc='Library for FIDO 2.0, including communication with a device over USBA'
url='https://github.com/Yubico/python-fido2'
license=('custom:BSD-2-clause')
arch=('any')
depends=(
    'python'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-poetry-core'
)
checkdepends=(
    'python-cryptography'
    'python-pyscard'
    'python-pytest'
)
validpgpkeys=('20EE325B86A81BCBD3E56798F04367096FBA95E8') # Dain Nilsson <dain@yubico.com>
source=("git+https://github.com/Yubico/${pkgname}.git?signed#tag=${pkgver}")
sha256sums=('761942d61bf52bc0f89f2a77db21ae4e87bbf000d000a898c3d17fc02cc7e31f')

build() {
  cd "${srcdir}/${pkgname}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"

  python -m unittest discover -vs .
}

package() {
  cd "${srcdir}/${pkgname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m0644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
