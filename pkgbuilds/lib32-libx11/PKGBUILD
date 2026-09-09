# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libx11
pkgver=1.8.13
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/lib/libx11"
depends=('lib32-libxcb' 'libx11' 'lib32-glibc' 'xorgproto')
makedepends=('xorg-util-macros' 'xorgproto' 'xtrans' 'gcc-multilib')
license=('MIT AND X11')
source=(https://xorg.freedesktop.org/releases/individual/lib/libX11-${pkgver}.tar.xz{,.sig})
sha512sums=('4c4a098eaff09a51309f3f322bc435ccd022c8f753974eb2650b60e42b737077ca0fde0df82b53f4ba8ed2388bbc8cb59ba66cc9946ae2b5907d7d1a9580e03d'
            'SKIP')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>
# validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

build() {
  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libX11-${pkgver}
  ./configure --prefix=/usr \
    --disable-static \
    --disable-xf86bigfont \
    --libdir=/usr/lib32 \
    --disable-specs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libX11-${pkgver}

  make check
}

package() {
  cd libX11-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
