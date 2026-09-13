# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=messagelib
pkgver=26.08.1
pkgrel=1
pkgdesc='KDE PIM messaging library'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(akonadi
         akonadi-contacts
         akonadi-mime
         akonadi-search
         glibc
         gpgmepp
         grantleetheme
         karchive
         kcalendarcore
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcontacts
         kcoreaddons
         kguiaddons
         ki18n
         kiconthemes
         kitemviews
         kmailtransport
         kmime
         kidentitymanagement
         kio
         kitemmodels
         kjobwidgets
         kmbox
         kpimtextedit
         kservice
         ktextaddons
         ktexttemplate
         ktextwidgets
         kwidgetsaddons
         kxmlgui
         libgcc
         libgravatar
         libkdepim
         libkleo
         libstdc++
         openssl
         pimcommon
         qgpgme
         qt6-base
         qt6-webengine
         sonnet
         syntax-highlighting)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('0f3d5b72a4c49bee88aa4c432b127f85e1f152eafecd6d5bd6abca5c05206d68'
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
