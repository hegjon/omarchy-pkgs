# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=7zip
pkgver=26.03
pkgrel=1
pkgdesc='File archiver for extremely high compression'
arch=(x86_64 aarch64)
url='https://www.7-zip.org'
license=('LGPL-2.1-or-later AND LicenseRef-UnRAR AND BSD-3-Clause AND BSD-2-Clause')
depends=(
  sh
  libgcc
  libstdc++
  glibc
)
makedepends_x86_64=(uasm)
provides=(p7zip)
conflicts=(p7zip)
replaces=(p7zip)
source=(https://7-zip.org/a/7z${pkgver//./}-src.tar.xz)
sha512sums=('469ebb37fb1495982ffee453cc6298dabb14b449e42fbe231001d0dae51ee3bcc83fdf46fec137a7cf7d6688a696b689a90d1aff3408d716e458b2ce064458c7')
b2sums=('d50364d6a3668ee4bc1528602eb779aafd6169e9a8a7fd2daaf1ebf10a963e8a9fa2a74b36219c34287b7ecae2bdab52abcfdb8840340181791994b087f44479')

build() {
  local _platform_flags=()

  case $CARCH in
    x86_64)
      _platform_flags=(PLATFORM=x64 IS_X64=1 MY_ASM=uasm USE_ASM=1)
      ;;
    i686)
      _platform_flags=(PLATFORM=x86 IS_X86=1 MY_ASM=uasm USE_ASM=1)
      ;;
    aarch64)
      _platform_flags=(PLATFORM=arm64 IS_ARM64=1 USE_ASM=1)
      ;;
  esac

  for component in Bundles/{Alone,Alone7z,Format7zF,SFXCon} UI/Console; do
    make -C CPP/7zip/$component -f ../../cmpl_gcc.mak "${_platform_flags[@]}" \
      LFLAGS_STRIP= \
      CC="cc $CPPFLAGS $CFLAGS $LDFLAGS" \
      CXX="g++ $CPPFLAGS $CXXFLAGS $LDFLAGS"
  done
}

package() {
  install -Dt "$pkgdir/usr/lib/7zip" \
    CPP/7zip/Bundles/Alone/b/g/7za \
    CPP/7zip/Bundles/Alone7z/b/g/7zr \
    CPP/7zip/Bundles/Format7zF/b/g/7z.so \
    CPP/7zip/UI/Console/b/g/7z
  install -D CPP/7zip/Bundles/SFXCon/b/g/7zCon "$pkgdir/usr/lib/7zip/7zCon.sfx"

  for _prog in 7za 7zr 7z; do
    printf '#!/bin/sh\nexec /usr/lib/7zip/%s "$@"\n' "$_prog" \
    | install -D /dev/stdin "$pkgdir/usr/bin/$_prog"
  done

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" DOC/{,unRar}License.txt
}

# vim:set ts=2 sw=2 et:
