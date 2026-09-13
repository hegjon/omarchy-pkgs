# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kevin Azzam <aur@azz.am>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=python-dotenv
pkgver=1.2.3
pkgrel=1
pkgdesc="Get and set values in your .env file in local and production servers"
arch=('any')
url="https://github.com/theskumar/python-dotenv/"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('ipython: ipython support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/theskumar/python-dotenv/archive/v${pkgver}.tar.gz")
b2sums=('11a337898fc4b8839b71658f11dd5580f2bb02a15943e0ad8cdb41aae3eefa6cd4bfd2c07a0ff1d43cbcd8e435e0a41749f18a56e4fcad823a6a56280e6ef3f0')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
