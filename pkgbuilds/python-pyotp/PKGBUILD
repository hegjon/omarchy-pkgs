# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-pyotp
_pkgname=pyotp
pkgver=2.10.0
pkgrel=1
pkgdesc='Python library for generating and verifying one-time passwords'
url='https://pyotp.readthedocs.io/'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-sphinx
  python-guzzle-sphinx-theme
  python-sphinxext-opengraph
)
options=(!makeflags)
source=("git+https://github.com/pyotp/pyotp#tag=v$pkgver")
sha512sums=('989fabeee80f6eb8c9a6d1a4840a462c021c3466841d400f1f349b525d61524d2e87a95dc5aaa6740edccdb9359bc33d1ae26d8925c76ca9653ba62925900f9f')
b2sums=('b3988156a9bec66a3bcf98ff425790ce36f9e9f77ac2790c879ac95a19b122a66ad27c7503f76a30e47f649ca516a897c0bab935be78c27a055d51e72111145c')

build() {
  cd ${_pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${_pkgname}
  python -m unittest -v
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # documentation
  install -Dm 644 README.rst ./docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"

  # man page
  install -Dm 644 ./docs/_build/man/${_pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
  ln -s /usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
