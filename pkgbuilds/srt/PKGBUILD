# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=srt
pkgver=1.5.7
pkgrel=1
pkgdesc="Secure Reliable Transport library"
url="https://www.srtalliance.org/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  bash
  glibc
  libgcc
  libstdc++
  openssl
)
makedepends=(
  cmake
  git
  ninja
)
source=("git+https://github.com/Haivision/srt#tag=v$pkgver")
b2sums=('b2016a1f664ee4c338de5537c4215cc5b8e91e93106801b077c6e3f3f79ac4048173e1dad2bf0b82812db1b134d496d84756b489ee81257197c412783f7d5301')

prepare() {
  cd srt
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DENABLE_STATIC=OFF
    -DENABLE_TESTING=ON
  )

  cmake -S srt -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ./uriparser-test
  ./utility-test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
