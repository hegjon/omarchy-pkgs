# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyjwt
pkgver=2.13.0
pkgrel=1
pkgdesc='JSON Web Token implementation in Python'
arch=(any)
url=https://github.com/jpadilla/pyjwt
license=(MIT)
depends=(
  python
  python-cryptography
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-pytest
)
source=(git+https://github.com/jpadilla/pyjwt.git#tag=${pkgver})
b2sums=('92d93124d86ba5e21c2922426d5225a5495c2f7e2339f449d4e4ed35352874bb2384a9e09df603507e13e6ddac8e5a4769a97f2b846be19ec0f140370c3ba3b0')

build() {
  cd pyjwt
  python -m build -wn
}

check() {
  cd pyjwt

  python -m installer -d test_dir dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
  python -m installer -d "${pkgdir}" pyjwt/dist/*.whl
  install -Dm 644 pyjwt/LICENSE -t "${pkgdir}"/usr/share/licenses/python-pyjwt/
}

# vim: ts=2 sw=2 et:
