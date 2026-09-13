# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kpimtextedit
pkgver=26.08.1
pkgrel=1
pkgdesc='A textedit with PIM-specific features'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(glibc
         kcodecs
         kconfig
         kcoreaddons
         ki18n
         kio
         ktextaddons
         kwidgetsaddons
         kxmlgui
         libstdc++
         qt6-base
         sonnet
         syntax-highlighting)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e8cd1bdcd58af6c7eac9ede5ec00c635766e9d32c3922e766028cb0c26eb7163'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
