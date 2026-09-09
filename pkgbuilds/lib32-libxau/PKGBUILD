# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxau
pkgname=lib32-$_pkgbasename
pkgver=1.0.12
pkgrel=1
pkgdesc="X11 authorisation library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('pkgconf' 'xorgproto')
provides=('libXau.so')
source=(${url}/releases/individual/lib/libXau-${pkgver}.tar.xz)
sha1sums=('5ab09f1f7cfc1962ab9b83b78faad2236989dcad')
sha256sums=('74d0e4dfa3d39ad8939e99bda37f5967aba528211076828464d2777d477fc0fb')

build() {
  cd "${srcdir}/libXau-${pkgver}"

  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXau-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
