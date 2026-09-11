# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=evolution-data-server
pkgname=(
  evolution-data-server
  libedataserverui4
  evolution-data-server-docs
)
pkgver=3.60.2
pkgrel=5
pkgdesc="Unified contacts, tasks and calendar backend"
url="https://gitlab.gnome.org/GNOME/evolution/-/wikis/home"
arch=(x86_64)
license=("LGPL-2.0-only AND LGPL-2.1-or-later")
depends=(
  cairo
  dconf
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  icu
  json-glib
  krb5
  libcanberra
  libgcc
  libgoa
  libgweather-4
  libical
  libldap
  libphonenumber
  libsecret
  libsoup3
  libstdc++
  libxml2
  nspr
  nss
  pango
  perl
  sqlite
  util-linux-libs
  webkit2gtk-4.1
  zlib
)
makedepends=(
  boost
  boost-libs
  cmake
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  gperf
  gtk-doc
  gtk4
  ninja
  postfix
  python
  vala
  webkitgtk-6.0
)
checkdepends=(db)
source=("git+https://gitlab.gnome.org/GNOME/evolution-data-server.git#tag=$pkgver")
b2sums=('526f59d41a16d718e3ecc1bc2525eee661eac9f0c5ffdd3a45af8142353158632b01c1cb76cae248e19a0caf97315897f9b2c9f51368c0972db33c004bc89a82')

prepare() {
  cd $pkgbase
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D LIBEXEC_INSTALL_DIR=/usr/lib
    -D SYSCONF_INSTALL_DIR=/etc
    -D ENABLE_GTK_DOC=ON
    -D ENABLE_GI_DOCGEN=ON
    -D ENABLE_INTROSPECTION=ON
    -D ENABLE_VALA_BINDINGS=ON
    -D WITH_LIBDB=OFF
    -D WITH_PHONENUMBER=ON
  )

  cmake -S $pkgbase -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ctest --force-new-ctest-process --output-on-failure
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_evolution-data-server() {
  provides=(
    libcamel-1.2.so
    libebackend-1.2.so
    libebook-1.2.so
    libebook-contacts-1.2.so
    libecal-2.0.so
    libedata-book-1.2.so
    libedata-cal-2.0.so
    libedataserver-1.2.so
    libedataserverui-1.2.so
  )

  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgdir"

  _pick ui4 usr/include/evolution-data-server/libedataserverui4
  _pick ui4 usr/lib/libedataserverui4-1.0.so*
  _pick ui4 usr/lib/pkgconfig/libedataserverui4-1.0.pc
  _pick ui4 usr/lib/girepository-1.0/EDataServerUI4-1.0.typelib
  _pick ui4 usr/share/gir-1.0/EDataServerUI4-1.0.gir
  _pick ui4 usr/share/vala/vapi/libedataserverui4-1.0.*

  _pick docs usr/share/gtk-doc
  _pick docs usr/share/doc
}

package_libedataserverui4() {
  pkgdesc+=" - GTK 4 UI library"
  depends=(
    "evolution-data-server=$pkgver-$pkgrel"
    glib2
    glibc
    gtk4
    libical
    libsoup3
    nspr
    nss
    pango
    webkitgtk-6.0
  )
  provides=(libedataserverui4-1.0.so)

  mv ui4/* "$pkgdir"
}

package_evolution-data-server-docs() {
  pkgdesc+=" - documentation"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
