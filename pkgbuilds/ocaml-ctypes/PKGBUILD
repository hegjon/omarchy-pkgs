# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Armin K. <krejzi at email dot com>

pkgname=ocaml-ctypes
pkgver=0.24.0
pkgrel=2
pkgdesc="Library for binding to C libraries using pure OCaml"
arch=('x86_64')
url="https://github.com/ocamllabs/ocaml-ctypes"
license=('MIT')
depends=('ocaml' 'libffi' 'ocaml-integers' 'ocaml-bigarray-compat')
makedepends=('ocaml-findlib' 'ocaml-compiler-libs' 'dune')
options=('!strip' '!makeflags' '!debug')
source=($pkgname-$pkgver.tar.gz::https://github.com/yallop/ocaml-ctypes/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('0fa640f00e2960a8ceae3bb9835c5318d3718e748f40adc3f0a50dcb9b38a696de2442f2e75a6ce2356bab7e7eb5edea5486a757e553c17207191a49ceaa307d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  dune build -p ctypes,ctypes-foreign
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
