# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: rebel <novakpetya at yahoo dot co dot uk>

pkgname=qt5pas
_lazarus_tag=4_8
epoch=1
pkgver=1.2.16
pkgrel=3
pkgdesc='Free Pascal Qt5 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt5/cbindings'
license=('LGPL3')
depends=('qt5-base' 'qt5-x11extras')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('461551b197d41502381be17e80bcb9194350e4c9acc018dc45d06b7d804de17b50fbfdb1b76acfc4ed8ffd8b2b84e9a8725d500084360978aaa4eebb26063dba')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt5/cbindings"
    qmake-qt5 "QT += x11extras"
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt5/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
