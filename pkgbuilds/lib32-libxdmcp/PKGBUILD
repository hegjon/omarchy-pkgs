# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxdmcp
pkgname=lib32-$_pkgbasename
pkgver=1.1.5
pkgrel=1
pkgdesc="X11 Display Manager Control Protocol library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xorg-util-macros' 'xorgproto')
provides=('libXdmcp.so')
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.xz{,.sig})
sha512sums=('d7a1d70a58b7d34ddd01a91d3ccbc086a36626b7081cfcbb150d24288c6adad612b042ba7ea63a218595afb2ee04384c0f8ba84ee3c6bd29913724b54e898d83'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd libXdmcp-${pkgver}

  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
              --libdir=/usr/lib32
  make
}

package() {
  cd libXdmcp-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
