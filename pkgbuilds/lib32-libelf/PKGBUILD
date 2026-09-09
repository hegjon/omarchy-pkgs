# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.196
pkgrel=2
pkgdesc="Handle ELF object files and DWARF debugging information (libraries, 32-bit)"
arch=(x86_64)
url="https://sourceware.org/elfutils/"
_url=https://forge.sourceware.org/elfutils/elfutils-mirror.git
license=('GPL-2.0-or-later OR LGPL-3.0-or-later')
depends=(
  "libelf=$pkgver"
  lib32-bzip2
  lib32-curl
  lib32-glibc
  lib32-json-c
  lib32-xz
  lib32-zlib
  lib32-zstd
)
makedepends=(
  git
  lib32-gcc-libs
)
# NOTE: the shared objects can not be added to provides as they are not versioned
source=($_name::git+$_url?signed#tag=$_name-$pkgver)
sha512sums=('ea440d94638326902e89506ab4a6e878f7ec9ae4c3672360bcc67511ca28b31fca8c0c7ef4ad1ae3463f635250ec745d55ce6afe3861ff63c90eb503ac63a47a')
b2sums=('08adddadcac1194c73d244f3ac25fb3e4300e782ea304119016bfe056ca8f3c3a3a7492b992091a35b1a9e430d1dcaf0d77e49585fcefcee5bd10526ba03c200')
validpgpkeys=(
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A'  # Mark Wielaard <mjw@gnu.org>
  '6C2B631563B8D330578D3CB474FD3FA2779E7073'  # Aaron Merey <amerey@redhat.com>
)

prepare() {
  cd $_name
  autoreconf -fiv
}

build() {
  local configure_options=(
    --build=i686-pc-linux-gnu
    --prefix=/usr
    --sysconfdir=/etc
    --libdir=/usr/lib32
    --program-prefix="eu-"
    --program-suffix="-32"
    --enable-deterministic-archives
    --enable-maintainer-mode
    --disable-debuginfod
    --disable-static
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  # debugging information is required for test-suite
  CFLAGS+=" -g"

  cd $_name
  ./configure "${configure_options[@]}"
  make
}

check() {
  # The "dwarf_srclang_check" test introduced in 0.193 needs libelf.so to run.
  # As such, we are passing LD_LIBRARY_PATH so it can find libelf.so from the
  # source built in build() in order to avoid a self (make)dependency.
  LD_LIBRARY_PATH="$PWD/$_name/libelf" make -C $_name check
}

package() {
  make DESTDIR="$pkgdir" install -C $_name

  # remove anything that would conflict with elfutils' packages
  rm -rf "$pkgdir/"{etc,usr/{bin,include,share}}
}

# vim:set sw=2 sts=-1 et:
