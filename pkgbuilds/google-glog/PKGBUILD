# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ian Yang <doit.ian@gmail.com>

pkgname=google-glog
pkgver=0.7.1
pkgrel=2
pkgdesc="Logging library for C++"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://github.com/google/glog"
depends=(
  gflags
  glibc
  libgcc
  libstdc++
)
makedepends=(
  cmake
  git
)
provides=(libglog.so)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('77316382ba8a0534ec3de7e894e8abc6cd2a3a7cf453c9791d783a76e0b21ad20c7c260857f4c8f3e1e997e404d48ae4e1c47576163d1b7c1eb09f235d20ba75')

build() {
  cmake -B build -S $pkgname \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -W no-dev \
    -DWITH_PKGCONFIG=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure -E stacktrace
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/COPYING
}
