# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=qt6pas
_lazarus_tag=4_8
pkgver=6.2.10
pkgrel=4
pkgdesc='Free Pascal Qt6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('461551b197d41502381be17e80bcb9194350e4c9acc018dc45d06b7d804de17b50fbfdb1b76acfc4ed8ffd8b2b84e9a8725d500084360978aaa4eebb26063dba')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
