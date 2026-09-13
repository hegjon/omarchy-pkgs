# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdepim-runtime
pkgver=26.08.1
pkgrel=1
pkgdesc='Extends the functionality of kdepim'
arch=(x86_64)
url='https://kontact.kde.org'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi
         akonadi-calendar
         akonadi-contacts
         akonadi-mime
         glibc
         kcalendarcore
         kcmutils
         kcodecs
         kconfig
         kconfigwidgets
         kcontacts
         kcoreaddons
         kdav
         ki18n
         kidentitymanagement
         kimap
         kio
         kldap
         kmailtransport
         kmime
         kmbox
         knotifications
         knotifyconfig
         kservice
         ktextaddons
         kwidgetsaddons
         kwindowsystem
         libgcc
         libkgapi
         libsasl
         libstdc++
         pimcommon
         qca-qt6
         qt6-base
         qt6-networkauth
         qt6-speech
         qt6-webengine
         qtkeychain-qt6)
makedepends=(extra-cmake-modules
             kdoctools
             libetebase)
optdepends=('libetebase: EteSync resource')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('524910cc66b8279c1fa8eba517ec63121e4b74cccbfe0549d73ddf5cfd6ee837'
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
