# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxext
pkgname=lib32-$_pkgbasename
pkgver=1.3.7
pkgrel=1
pkgdesc="X11 miscellaneous extensions library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('LicenseRef-libxext')
depends=('lib32-libx11' $_pkgbasename 'lib32-glibc')
makedepends=('xorg-util-macros' 'gcc-multilib')
source=(${url}/releases/individual/lib/libXext-${pkgver}.tar.xz{,.sig})
sha512sums=('09cd230da472e87e4fdbc9b0f83a9181cc44af04c06fa4a7d8aa405e0f8551d3ac3a4b379249c44d97e1025b60d1c52f8ca13817eed0206e2bf3d66a55d89701'
            'SKIP')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd "${srcdir}/libXext-${pkgver}"

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXext-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
