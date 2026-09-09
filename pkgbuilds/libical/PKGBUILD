# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=libical
pkgname=(libical
         libical-docs)
pkgver=4.0.5
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=(x86_64)
url='https://github.com/libical/libical'
license=('LGPL-2.1-only' 'MPL-2.0')
depends=(glib2
         glibc
         icu
         libgcc
         libstdc++
         libxml2)
makedepends=(cmake 
             doxygen
             gi-docgen
             git
             gobject-introspection
             jdk-openjdk
             vala)
checkdepends=(python-gobject)
source=(git+https://github.com/libical/libical#tag=v$pkgver)
sha512sums=('8ae8042a904a904cdcc1bdae7d6b71e93e23f2dfba4a3a2cf44c1db8ee68ac6817bb2674a6dbf1074ffdce51fc543c127480fa12e3e42866de8b920f86f28057')

build() {
  cmake -S $pkgname -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DLIBICAL_BUILD_TESTING=true \
    -DLIBICAL_GOBJECT_INTROSPECTION=true \
    -DLIBICAL_GLIB_VAPI=true \
    -DCMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package_libical() {
  DESTDIR="${pkgdir}" cmake --install build

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libical-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
