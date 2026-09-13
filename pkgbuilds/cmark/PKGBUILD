# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=cmark
pkgver=0.31.2
pkgrel=1
pkgdesc='CommonMark parsing and rendering library and program in C'
arch=(x86_64)
url='https://github.com/commonmark/cmark'
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(cmake
             git
             python)
source=(git+https://github.com/commonmark/cmark#tag=$pkgver)
sha512sums=('bb1f7c9a8ca2a506a5f68ce78c768c9c509809ccabfb70fc1b6ccb612f22628f4922b291ed063a41858a6d045e9d68a5a31f37bffbe201d5a5c4710ac547747d')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMARK_STATIC=OFF
  cmake --build build
}

check() {
  cd build
  ctest --rerun-failed --output-on-failure -E pathological_tests_library
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm 644 $pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
