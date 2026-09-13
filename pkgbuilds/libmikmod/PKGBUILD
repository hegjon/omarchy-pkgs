# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libmikmod
pkgver=3.3.14
pkgrel=1
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM"
url="https://mikmod.sourceforge.net"
license=(LGPL-2.0-or-later)
arch=(x86_64)
depends=(
  glibc
  sh
)
makedepends=(
  alsa-lib
  cmake
  git
  libpulse
  ninja
)
provides=(libmikmod.so)
source=(
  "git+https://git.code.sf.net/p/mikmod/mikmod#tag=libmikmod-$pkgver"
)
b2sums=('5050ab01b2a9f295abc4b1ce5f226ad9185f678dd915c416886f090e6bea019d582336b03af3f8e50b15aa5b075ab9985c05be15ed3030696919987b09b81f94')

prepare() {
  cd mikmod
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_DL=1
  )

  cmake -S mikmod/libmikmod -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
