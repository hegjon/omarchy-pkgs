# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere@gmail.com>

pkgname=python-slugify
pkgver=8.0.4
pkgrel=6
pkgdesc='A Python slugify application that handles unicode'
arch=(any)
url=https://github.com/un33k/python-slugify
license=(MIT)
depends=(
  python
  python-text-unidecode
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=('python-unidecode: Unidecode support')
source=(git+https://github.com/un33k/python-slugify.git#tag=v${pkgver})
b2sums=('53b44caed4ccccedb66ca81459baee5f3b361a3b884d6a71646e67821a4172db62512e9f6fa126fed3574aef84e6d30cf482ec208f5c627706a9a5e48e9c4b5f')

build() {
  cd python-slugify
  python -m build --wheel --no-isolation
}

package() {
  cd python-slugify
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-slugify/
}
