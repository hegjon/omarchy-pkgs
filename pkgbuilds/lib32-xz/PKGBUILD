# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=lib32-xz
pkgver=5.8.3
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (32-bit)'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=("GPL-2.0-or-later AND 0BSD AND LicenseRef-Public-Domain AND LGPL-2.1-or-later")
depends=('lib32-glibc' 'xz')
makedepends=('git' 'po4a' 'doxygen')
provides=('liblzma.so')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://github.com/tukaani-project/xz#tag=v${pkgver}?signed")
sha256sums=('ac5336c53dfc666810582c21b22f89bab021d3afbe6cb365c80fbfcbe73a6c24')
sha512sums=('47f7d0cdd200c0db0bee0cf5d1419993d02219ee7c52dc3ea017a9b6af5c2dc5c0d80eab485715f2eb7016829ad14963e836bf07b32b11b9743fd933df2476d0')

prepare() {
  cd xz

  ./autogen.sh
}

build() {
  cd xz

  export CC='gcc -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-rpath \
    --enable-werror
  make
}

check() {
  cd xz

  make check
}

package() {
  cd xz

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -d -m0755 "${pkgdir}"/usr/share/licenses
  ln -s xz "${pkgdir}"/usr/share/licenses/lib32-xz
}
