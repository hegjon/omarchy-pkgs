# Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-e2fsprogs
pkgver=1.47.4
pkgrel=1
pkgdesc='Ext2/3/4 filesystem libraries (32-bit)'
arch=('x86_64')
license=('GPL' 'LGPL' 'MIT')
url='http://e2fsprogs.sourceforge.net'
depends=('lib32-glibc' 'e2fsprogs')
makedepends=('git' 'bc' 'lib32-util-linux' 'gcc-multilib')
provides=('libcom_err.so'
          'libe2p.so'
          'libext2fs.so'
          'libss.so')
validpgpkeys=('3AB057B7E78D945C8C5591FBD36F769BC11804F0') # Theodore Ts'o <tytso@mit.edu>
source=("git+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git#tag=v${pkgver}?signed")
sha256sums=('e738cbd6e437988248a5ed143458e33cdbfe17ebfa3818b7f6a6a66264895a66')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/e2fsprogs"

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --with-root-prefix='' \
    --enable-elf-shlibs \
    --disable-{debugfs,imager,resizer,fsck,uuidd,libuuid,libblkid}
  make
}

package() {
  cd "${srcdir}/e2fsprogs"

  make DESTDIR="${pkgdir}" install-libs

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  mkdir -p "${pkgdir}"/usr/share/licenses
  ln -s e2fsprogs "${pkgdir}/usr/share/licenses/${pkgname}"
}
