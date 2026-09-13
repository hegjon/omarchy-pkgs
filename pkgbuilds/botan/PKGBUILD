# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

pkgname=botan
pkgver=3.13.0
pkgrel=1
pkgdesc='Crypto library written in C++'
arch=(x86_64)
url='https://botan.randombit.net/'
license=(BSD-2-Clause)
depends=(bzip2
         glibc
         libgcc
         libstdc++
         sqlite
         xz
         zlib)
makedepends=(boost
             python)
optdepends=('boost-libs: for the botan executable'
            'python: for using botan2.py')
source=(https://botan.randombit.net/releases/Botan-${pkgver}.tar.xz{,.asc})
sha256sums=('12f5a8358890bbee82edfe9d2e7769b0a610b6dd0e0698aea13d20a675d84620'
            'SKIP')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC') # Botan Distribution Key

build() {
  cd ${pkgname^}-$pkgver

  ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-lzma \
    --with-zlib \
    --with-boost \
    --with-sqlite3 \
    --with-os-feature=getrandom
  make
}

check() {
  cd ${pkgname^}-$pkgver

  LD_LIBRARY_PATH="$PWD" ./botan-test --test-threads=1
}

package() {
  DESTDIR="$pkgdir" make -C ${pkgname^}-$pkgver install
  install -Dm644 ${pkgname^}-$pkgver/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
