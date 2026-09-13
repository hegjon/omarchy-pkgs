# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-calendar
pkgver=26.08.1
pkgrel=1
pkgdesc='Akonadi calendar integration'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(akonadi
         akonadi-contacts
         akonadi-mime
         glibc
         gpgmepp
         kcalendarcore
         kcalutils
         kcodecs
         kconfig
         kcontacts
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kidentitymanagement
         kio
         kitemmodels
         kmailtransport
         kmime
         knotifications
         kservice
         kwidgetsaddons
         kxmlgui
         libgcc
         libkleo
         libstdc++
         messagelib
         qgpgme
         qt6-base)
makedepends=(extra-cmake-modules
             pyside6
             python-build
             python-setuptools
             shiboken6-generator)
optdepends=('pyside6: Python bindings')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('7fd92f7b4be2b36ff33b96ec8668285b967d3a0dcd26d61ac9826524dc99cfba'
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
