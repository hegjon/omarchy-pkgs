# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jürgen Hötzel <juergen@hoetzel.info>

pkgname=ocamlbuild
pkgver=0.16.1
pkgrel=7
pkgdesc='Build tool that has built-in rules for building OCaml libraries and programs'
arch=(x86_64)
license=(GPL-2.0-only)
url='https://github.com/ocaml/ocamlbuild'
depends=(ocaml zstd)
options=(!makeflags)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
b2sums=('ffd0dbe8421e3ec5eabb3e6ee3844c3ad22d77d4eb0d5e34dd7a8be722b78c146fc5762c16047b7050d9ce547815a58cec6091a15e783e157b1d38c2c3787b5f')

build() {
  cd $pkgname-$pkgver
  make configure PREFIX=/usr MANDIR=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
