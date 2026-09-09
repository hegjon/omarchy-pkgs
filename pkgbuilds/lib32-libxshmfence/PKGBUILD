# Maintainer: AndyRTR <andyrtr@archlinux.org>

_pkgbasename=libxshmfence
pkgname=lib32-$_pkgbasename
pkgver=1.3.3
pkgrel=1
pkgdesc="a library that exposes a event API on top of Linux futexes (32-bit)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('GPL')
#groups=()
depends=('lib32-glibc' ${_pkgbasename})
makedepends=('xorg-util-macros' 'xorgproto' 'gcc-multilib')
source=(${url}/releases/individual/lib/${_pkgbasename}-${pkgver}.tar.xz{,.sig})
sha512sums=('2261b840ea621cf4ce31961ec9df17aa2e253b268afe289dfb97c240aee27b9f443fe36de5de52a2e1210b69092efde21871e20556bac9b4f1d8a3ead1b4c498'
            'SKIP')
validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # Keith Packard <keithp@keithp.com>
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd $_pkgbasename-$pkgver

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # fix some libtools errors
  autoreconf -vfi
	
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd $_pkgbasename-$pkgver
  make -k check
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir/" install

  rm -r "${pkgdir}"/usr/include
	
  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}

