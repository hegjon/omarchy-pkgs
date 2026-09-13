# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jan@archlinux.org>

pkgname=gnome-menus
pkgver=3.38.1
pkgrel=1
pkgdesc="GNOME menu specifications"
url="https://gitlab.gnome.org/GNOME/gnome-menus"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  glib2
  glibc
)
makedepends=(
  git
  gobject-introspection
)
provides=(libgnome-menu-3.so)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-menus.git?signed#tag=$pkgver")
b2sums=('8938032023025f89de93d2baab7fc647aa3f9a00841fbd822a55c735f83dadff5f89a6aa1b5d84effc808921863e96c9d5e7a260cb9b448ef9a071907ac1bc20')
validpgpkeys=(
  53EF3DC3B63E2899271BD26322E8091EEA11BBB7 # Emmanuele Bassi <ebassi@gnome.org>
)

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package(){
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
