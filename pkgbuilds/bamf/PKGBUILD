# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=bamf
pkgver=0.5.6
pkgrel=4
pkgdesc='Application matching framework'
arch=(x86_64)
url=https://launchpad.net/bamf
license=(
  GPL-3.0-only
  LGPL-2.1-only
  LGPL-3.0-only
)
depends=(
  bash
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libgtop
  libwnck3
  libx11
  startup-notification
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  vala
)
source=(git+https://git.launchpad.net/bamf?signed#tag=${pkgver})
validpgpkeys=(D4C501DA48EB797A081750939449C2F50996635F) # Marco Trevisan (Treviño) <mail@3v1n0.net>
b2sums=('54a4aeb5a06efec8e8209a8456d873880694f2a6001ab7124763a20509cbbcc585dc6e732d5fac925acff29a878ccdc4adcacde9fa303eb994dfc2a94c6c5217')

prepare() {
  cd bamf
  autoreconf -fiv
}

build() {
  cd bamf
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make DESTDIR="${pkgdir}" -C bamf install
}

# vim: ts=2 sw=2 et:
