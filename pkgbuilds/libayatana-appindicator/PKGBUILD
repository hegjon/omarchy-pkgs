# Maintainer:
# Contributor: Robert Tari <robert at tari dot in>

pkgname=libayatana-appindicator
pkgver=0.6.0
pkgrel=2
pkgdesc='Ayatana Application Indicators shared library'
arch=(x86_64)
url='https://github.com/AyatanaIndicators/libayatana-appindicator'
license=(GPL-3.0-only)
depends=(glib2
         glibc
         gtk3
         libdbusmenu-glib
         libdbusmenu-gtk3
         libgcc)
makedepends=(cmake
             git
             glib2-devel
             gobject-introspection
             vala)
source=(git+https://github.com/AyatanaIndicators/$pkgname#tag=$pkgver
        libayatana-appindicator-vendorize-indicator.patch
        libayatana-appindicator-systray-fallback.patch)
sha256sums=('fc09340ad932ac0803a5b813b9c4219bec50d2b0f1e5e07e0a5bcc86fc0fc751'
            '0348ec7dbeb3fb15073ecd70ca28ce3578227fa1d24487fcd7d9b6f90cc69eb1'
            'c14713ba41c165f04e583d709b4c2f21ba0604838aa6b0c629299e1f66b86d83')

prepare() {
  cd $pkgname

  # Vendorize indicator-desktop-shortcuts from libayatana-indicator project
  # https://github.com/AyatanaIndicators/libayatana-appindicator/pull/6
  git apply -3 ../libayatana-appindicator-vendorize-indicator.patch

  # Fall back to tray icon when StatusNotifierHost is not available
  # https://github.com/AyatanaIndicators/libayatana-appindicator/pull/7
  git apply -3 ../libayatana-appindicator-systray-fallback.patch
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BINDINGS_MONO=OFF \
    -DENABLE_GTKDOC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
