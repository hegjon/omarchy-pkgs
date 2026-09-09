# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=zvbi
pkgver=0.2.45
pkgrel=1
pkgdesc='VBI capture and decoding library'
url=http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome
arch=(x86_64)
depends=(
  libpng
  libx11
)
makedepends=(git)
license=(
  GPL-2.0-or-later
  GPL-2.0-only
  LGPL-2.1-or-later
  MIT
)
_tag=45138a87f86b683f9c3611793752ac08795d836f
#source=(git+https://github.com/zapping-vbi/zvbi.git?signed#tag=${_tag})
source=(git+https://github.com/zapping-vbi/zvbi.git#tag=${_tag})
b2sums=('feaad69f28c4e2e5db4d938933b848c1d7e39e470f47d857e76c01b637326febda6594dbd9a1bd6f59baff9262523e734bc76ebe224de0af0b2e62b5a526a493')
validpgpkeys=(FA26CA784BE188927F22B99F6570EA01146F7354) # Ileana Dumitrescu <ileanadumitrescu95@gmail.com>

prepare() {
  cd zvbi
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd zvbi
  git describe --tags | sed 's/^v//'
}

build() {
  cd zvbi
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package() {
  cd zvbi
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING.md -t "${pkgdir}"/usr/share/licenses/zvbi
}

# vim: ts=2 sw=2 et:
