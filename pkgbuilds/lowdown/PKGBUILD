# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=lowdown
pkgver=3.1.1
pkgrel=1
pkgdesc='A simple Markdown translator'
arch=(x86_64)
url='https://kristaps.bsd.lv/lowdown'
license=(ISC)
depends=(glibc libmd)
makedepends=(git bmake)
provides=(liblowdown.so)
source=("$pkgname::git+https://github.com/kristapsdz/lowdown#tag=$(echo $pkgver | sed -e 's/^/VERSION_/' -e 's/\./_/g')")
sha512sums=('7cdf07b8ce3b88f4c07091a65ab0e7353fd6db2d7ff6f4e15087fcb173876c545ca8850cc91c06f49ef82bb81999436588263dabc26f5af2c039b4082803f3b3')
b2sums=('3aedf155e80d7904d98a196351234e8da9b1314fdf27098f7500c57edee84a0d15b2bb9d2158cdbbd21cbb4142231e9c51724b03537c7a59d71f42927b4388bb')

build () {
  cd "$pkgname"

	./configure \
    PREFIX=/usr \
    MANDIR=/usr/share/man

  # ensure LDFLAGS is passed correctly
  sed -i "s/^LDFLAGS.*/LDFLAGS = $LDFLAGS/" Makefile.configure

	bmake
}

check () {
	bmake -C "$pkgname" regress
}

package () {
  cd "$pkgname"

  # package
	bmake DESTDIR="$pkgdir" \
    install \
    install_lib_common \
    install_shared

  # symlink unversioned to versioned shared library
  local LIBVER=$(grep "^LIBVER" Makefile | sed "s/.*= //")
  ln -sf "/usr/lib/liblowdown.so.$LIBVER" "$pkgdir/usr/lib/liblowdown.so"

  # license
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
