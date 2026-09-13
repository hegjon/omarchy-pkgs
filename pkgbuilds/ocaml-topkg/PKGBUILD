# Maintainer:  Jürgen Hötzel <juergen@archlinux.org>
pkgname=ocaml-topkg
pkgver=1.1.1
pkgrel=1
pkgdesc="A packager for distributing OCaml software"
arch=('x86_64')
url="https://erratique.ch/software/topkg"
license=('BSD')
depends=('ocaml' 'ocaml-result')
makedepends=('ocaml-findlib' 'ocamlbuild' 'opam' 'ocaml-compiler-libs')
source=("https://erratique.ch/software/topkg/releases/topkg-${pkgver}.tbz")
sha512sums=('c36c549a362ddf5b7fe3f6ff91c79b7ab531c43633bb9737576370bcbd69db7e1625d247c278a869b503d45a175e9753231ccf595e5bfa4e3b7e2602ac3d3b42')

build() {
  cd "${srcdir}/topkg-${pkgver}"

  pkg/pkg.ml build --pkg-name topkg
}

package() {
  cd "${srcdir}/topkg-${pkgver}"

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/topkg/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
