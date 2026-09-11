# Maintainer:  Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer:  Eli Schwartz <eschwartz@archlinux.org>
# Contributor: TJ Vanderpoel <tj@rubyists>
# Contributor: RocketDev <ma2014119@outlook.com>

pkgbase=musl
pkgname=(musl musl-aarch64 musl-riscv64)
_archs=("aarch64" "riscv64")
pkgver=1.2.6
pkgrel=2
pkgdesc='Lightweight implementation of C standard library'
arch=('x86_64')
url='https://www.musl-libc.org/'
license=('MIT')
options=('staticlibs' '!buildflags')
makedepends=('aarch64-linux-gnu-gcc' 'riscv64-linux-gnu-gcc')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://www.musl-libc.org/releases/musl-$pkgver.tar.gz{,.asc}
	https://www.openwall.com/lists/musl/2025/02/13/1/1
	https://www.openwall.com/lists/musl/2025/02/13/1/2)
sha256sums=('d585fd3b613c66151fc3249e8ed44f77020cb5e6c1e635a616d3f9f82460512a'
            'SKIP'
            '0896fcdb5125d9d0723f4e165f13c209830e7045a75cba4e858060837cb7292e'
            '0620fcee4e8a4e52ebe1ea75e2b51d2197ebda242489c0586924eafa9e9606a1')

prepare() {
  cd $pkgname-$pkgver
#  patch -p1 -i "$srcdir"/1
#  patch -p1 -i "$srcdir"/2

  cd "$srcdir"
  for _arch in "${_archs[@]}"; do
    p="$pkgbase-$pkgver-${_arch}"
    rm -rf "$p"
    cp -a $pkgname-$pkgver "$p"
  done
}

build() {
  # Copy common flags from makepkg.conf that apply to cross compilers
  export CFLAGS="-O2 -pipe -fno-plt -fexceptions -Wformat \
    -Werror=format-security -fstack-clash-protection -fno-omit-frame-pointer \
    -mno-omit-leaf-frame-pointer -g -ffat-lto-objects"
  export LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro \
    -Wl,-z,now -Wl,-z,pack-relative-relocs"

  for _arch in "${_archs[@]}"; do
    pushd "$pkgbase-$pkgver-${_arch}"
    CROSS_COMPILE="${_arch}-linux-gnu-" \
    ./configure --prefix=/usr/${_arch}-linux-musl/lib/musl \
      --exec-prefix=/usr/${_arch}-linux-musl \
      --enable-wrapper=all \
      --target="${_arch}-linux-musl" \
      CFLAGS="$CFLAGS -ffile-prefix-map=\"$srcdir=/usr/src/debug/musl-$_arch\""
    make
    popd
  done

  cd $pkgname-$pkgver
  ./configure --prefix=/usr/lib/musl \
    --exec-prefix=/usr \
    --enable-wrapper=all \
    CFLAGS="$CFLAGS -ffile-prefix-map=\"$srcdir=/usr/src/debug/musl\""
  make
}

package_musl() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  ln -s ./musl-gcc "$pkgdir"/usr/bin/x86_64-linux-musl-gcc

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib

  install -Dm0644 README "$pkgdir"/usr/share/doc/musl/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/musl/COPYRIGHT
}

package_musl-aarch64() {
  cd "$pkgbase-$pkgver-aarch64"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/bin
  ln -s ../aarch64-linux-musl/bin/musl-gcc "$pkgdir"/usr/bin/aarch64-linux-musl-gcc

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/aarch64-linux-musl/lib/
  rmdir "$pkgdir"/lib

  install -Dm0644 README "$pkgdir"/usr/share/doc/musl-aarch64/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/musl-aarch64/COPYRIGHT
}

package_musl-riscv64() {
  cd "$pkgbase-$pkgver-riscv64"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/bin
  ln -s ../riscv64-linux-musl/bin/musl-gcc "$pkgdir"/usr/bin/riscv64-linux-musl-gcc

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/riscv64-linux-musl/lib/
  rmdir "$pkgdir"/lib

  install -Dm0644 README "$pkgdir"/usr/share/doc/musl-riscv64/README
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/musl-riscv64/COPYRIGHT
}
