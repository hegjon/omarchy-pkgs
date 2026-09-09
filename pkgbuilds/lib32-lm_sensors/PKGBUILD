# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Lubosz Sarnecki <lubosz0@gmail.com>

pkgname=lib32-lm_sensors
pkgver=3.6.2
_pkgver=${pkgver//./-}
pkgrel=2
epoch=1
pkgdesc="Collection of user space tools for general SMBus access and hardware monitoring (32-bit)"
arch=('x86_64')
url="http://www.lm-sensors.org/"
license=('GPL-2.0-only OR LGPL-2.1-only')
#makedepends=('git')
depends=('lm_sensors' 'lib32-glibc')
provides=('libsensors.so')
source=(lm_sensors-${pkgver}.tar.gz::https://github.com/hramrach/lm-sensors/archive/refs/tags/V${_pkgver}.tar.gz)
sha256sums=('c6a0587e565778a40d88891928bf8943f27d353f382d5b745a997d635978a8f0')

prepare() {
  cd "${srcdir}"/lm-sensors*

  sed -i 's/CC := gcc/CC := gcc -m32/' Makefile
}

build() {
  cd "${srcdir}"/lm-sensors*

  make PREFIX=/usr
}

package() {
  cd "${srcdir}"/lm-sensors*
  
  make PREFIX=/usr LIBDIR=/usr/lib32 BUILD_STATIC_LIB=0 DESTDIR="${pkgdir}" install 
  
  rm -r "${pkgdir}"/etc/
  rm -r "${pkgdir}"/usr/{bin,sbin,include,man}
  rm -r "${pkgdir}"/usr/share/zsh
}

