# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libkdepim
pkgver=26.08.1
pkgrel=1
pkgdesc='Libraries for KDE PIM applications'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(glibc
         ki18n
         kwidgetsaddons
         libstdc++
         qt6-base)
makedepends=(extra-cmake-modules
             kcompletion
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('f4de990ab9a8e38b9f73870c1f9523d51c69ede75b8ccf2d62e51be48a861682'
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
