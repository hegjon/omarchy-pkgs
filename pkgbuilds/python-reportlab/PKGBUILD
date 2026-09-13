# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>

_origname=reportlab
pkgname=python-reportlab
pkgver=5.0.1
pkgrel=1
pkgdesc="A proven industry-strength PDF generating solution"
arch=('any')
url="https://www.reportlab.com/"
depends=('python' 'python-charset-normalizer' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD-3-Clause')
source=(https://files.pythonhosted.org/packages/source/${_origname::1}/${_origname}/${_origname}-${pkgver}.tar.gz)
sha256sums=('ebd13154be1c8515e665de70bd2d303ae9ddc3ef47e44afd5116441ca0283a26')

build() {
    cd ${_origname}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd ${_origname}-${pkgver}/tests
    python runAll.py
}

package() {
    cd ${_origname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
