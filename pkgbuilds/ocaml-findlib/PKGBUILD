# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Sebastian Wiesner <lunaryorn@googlemail.com>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: scj <scj@archlinux.us>
# Contributor: Alif <alive4ever@live.com>

pkgname=ocaml-findlib
pkgver=1.9.8
pkgrel=7
pkgdesc='OCaml package manager'
arch=(x86_64)
url='http://projects.camlcity.org/projects/findlib.html'
license=(MIT)
depends=(ocaml-compiler-libs)
options=(staticlibs zipman)
source=("http://download.camlcity.org/download/findlib-$pkgver.tar.gz")
b2sums=('2483d2b833d566508680a5b9b3949aef187c290ab5602ef423ede214cb57f4b8f61dfeb9cc712499d8c7d0590388bf5e481263bbc841488e1fb62e866f9b64d8')

build() {
  cd findlib-$pkgver
  ./configure -config /etc/findlib.conf -mandir /usr/share/man -sitelib /usr/lib/ocaml
  make -j 1 all opt 
}

package () {
  cd findlib-$pkgver
  make prefix="$pkgdir" install
  install -Dm755 src/findlib/ocamlfind_opt "$pkgdir/usr/bin/ocamlfind_opt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
