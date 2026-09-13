# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgname=ocaml-augeas
pkgver=0.7
pkgrel=3
pkgdesc="OCaml bindings for Augeas"
arch=(x86_64)
url="https://people.redhat.com/~rjones/augeas/"
license=(LGPL-2.0-or-later)
depends=(
  augeas
  glibc
)
makedepends=(
  ocaml
  ocaml-findlib
)
source=(
  https://download.libguestfs.org/ocaml-augeas/$pkgname-$pkgver.tar.gz{,.sig}
)
sha256sums=('ee3899c85d5b22cdcc659183e571add0980725a8a705a9fe7bf53ddc2ba2dd63'
            'SKIP')
validpgpkeys=(F7774FB1AD074A7E8C8767EA91738F73E1B768A0) # Richard W.M. Jones <rjones@redhat.com>

build() {
  cd $pkgname-$pkgver
  # ocamlmklib rejects raw -Wl,... flags; it only accepts -Wl,-rpath,...
  unset LDFLAGS
  export CFLAGS+=" -ffat-lto-objects"
  ./configure
  make -j1
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver

  # install stublibs dir, as ocamlfind does not do that and we need it to not have ocamlfind run ldconfig
  install -vdm 755 "$pkgdir"/usr/lib/ocaml/stublibs
  OCAMLFIND_DESTDIR="$pkgdir/usr/lib/ocaml" make install
}
