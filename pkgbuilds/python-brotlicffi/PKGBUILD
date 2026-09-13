# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-brotlicffi
pkgver=1.2.0.2
pkgrel=1
pkgdesc='Python bindings to the Brotli compression library'
arch=(x86_64)
url=https://github.com/python-hyper/brotlicffi
license=(MIT)
depends=(
  brotli
  glibc
  python
  python-cffi
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(git+https://github.com/python-hyper/brotlicffi.git#tag=v${pkgver})
b2sums=('b2610f32fd804a4ab14b106695673bb4f278fed63931b59e3294c834dc1991b21a3525dd2ec6fdb60ce13b34b6b766d9e14e29e6bb9d32470e54ffac9be94e68')

build() {
  cd brotlicffi
  USE_SHARED_BROTLI=1 python -m build --wheel --no-isolation
}

package() {
  cd brotlicffi
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-brotlicffi
}
