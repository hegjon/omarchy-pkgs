# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero
pkgver=3.12.3+r44+gdea4990b
pkgrel=2
pkgdesc="CD/DVD mastering tool"
url="https://wiki.gnome.org/Apps/Brasero"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  cdrtools
  dconf
  dvd+rw-tools
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gstreamer
  gtk3
  gvfs
  hicolor-icon-theme
  libcanberra
  libnotify
  libxml2
  pango
  totem-pl-parser
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool
  itstool
  libburn
  libisofs
  libsm
  yelp-tools
)
optdepends=(
  'cdrdao: Alternative backend to copy, burn and blank CDs'
  'dvdauthor: Create disc images suitable for video DVDs'
  'libburn: Alternative backend to burn, blank and format CDs, DVDs and BDs'
  'libdvdcss: Copy CSS encrypted video DVDs to a disc image'
  'libisofs: Alternative backend to create disc images from a file selection'
  'vcdimager: Create disc images suitable for SVCDs'
)
_commit=dea4990bdcc886c37d8f776fb52bda051e1dee0f  # master
source=(
  "git+https://gitlab.gnome.org/GNOME/brasero.git#commit=$_commit"
  0001-Update-metainfo-file-to-follow-the-latest-specificat.patch
  0002-libbrasero-burn-Fix-incorrect-condition-during-error.patch
  0003-cdrdao-Add-better-error-message-for-Unsupported-trac.patch
  0004-cdrkit-Add-better-error-message-for-Unsupported-sect.patch
  0005-Replace-BaobabCellRendererProgress-with-native-GtkCe.patch
  0006-Remove-libegg-multidrag-treeview-support-for-in-buil.patch
)
b2sums=('f70cecff851909dc545b8a0159f6d0cc6b40b851da7dc8124ac80799859f89fd9df3f30379f03fdf3bc46152ba35b0908ea8698bac05b8de0f85d208365b4517'
        '26a6df234ea97bfe198946c0818f75c82c8e4554e99891eb80db25d9d7eb8406250ec95ae7fd6dce7b1953daaed3668d4f43390cc97413e08e48a237efd970eb'
        '8509b4d71249151d27ca72b73ffa1644af341ecd0d4a0a606533eead815b99e6ad67e68bffee9e38afcaa98e29e78fd3ef8717234c5c55ec14615688ee5a4ca5'
        '9d37f56d7fe9c26a0f641d7f433a6a331b29b97ce05c7790ecef8360f980422b6acd9c099d872e1b6bd4a3a2cb68d0ef2e21e7952078664b827a3c674f6731e4'
        'a742b82797e021d7df7bb1b86b098037fb3d4d8aa4d22088a305e98e207158cb608cf939f93c27d0142f2dba47b7b3eab63396543ef6baa09c87c1cb50a27254'
        '78864eef85d05edbac13932baca3a343394771313a0c341b64c98b20bd363ece3e8bff43afcf05fbbe59a90b3a2f22ab776d6833707ab557827aee542f800286'
        'e631169739d178365affc0a6370de5e3dbca5e0ec2a25c4a03aa85cf2b4abb1cb1ab168b36713f01e3b4490f26b6acdbab2c6435272474c10e4f3bd5d1cced71')

pkgver() {
  cd brasero
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd brasero

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/11
  git apply -3 ../0001-Update-metainfo-file-to-follow-the-latest-specificat.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/22
  git apply -3 ../0002-libbrasero-burn-Fix-incorrect-condition-during-error.patch
  git apply -3 ../0003-cdrdao-Add-better-error-message-for-Unsupported-trac.patch
  git apply -3 ../0004-cdrkit-Add-better-error-message-for-Unsupported-sect.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/28
  git apply -3 ../0005-Replace-BaobabCellRendererProgress-with-native-GtkCe.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/29
  git apply -3 ../0006-Remove-libegg-multidrag-treeview-support-for-in-buil.patch

  # Remove gnome-common dependency
  sed -i '/^GNOME_/d' configure.ac

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-caches
    --disable-search
    --disable-schemas-compile
    --enable-compile-warnings=minimum
    --enable-gtk-doc
  )

  cd brasero
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd brasero
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
