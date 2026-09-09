# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxxf86vm
pkgname=lib32-$_pkgbasename
pkgver=1.1.7
pkgrel=1
pkgdesc="X11 XFree86 video mode extension library (32-bit)"
arch=('x86_64')
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('lib32-libxext' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib)
source=(${url}/releases/individual/lib/libXxf86vm-${pkgver}.tar.xz{,.sig})
sha512sums=('d1051c9698a884d86e5beb00d5ee148d2b5ded7fd05168861f722b89643ad9b7f7d220f0cbb64b290a69faf9a6630181533aaddb01c9c68b46f1e5625030f094'
            'SKIP')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/libXxf86vm-${pkgver}"
  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXxf86vm-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
