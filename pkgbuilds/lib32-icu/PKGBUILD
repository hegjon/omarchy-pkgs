# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-icu
pkgver=78.3
pkgrel=1
pkgdesc="International Components for Unicode library (32 bit)"
arch=(x86_64)
url="https://icu.unicode.org"
license=('LicenseRef-Unicode-3.0'
         'BSD-2-Clause'
         'BSD-3-Clause'
         'NAIST-2003')
depends=('lib32-gcc-libs' 'lib32-glibc' 'icu')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver}/icu4c-${pkgver}-sources.tgz{,.asc} 
        ICU-22132.patch
        icu-77.1-invalid-malloc.patch)
# https://github.com/unicode-org/icu/releases/download/release-78.3/SHASUM512.txt
sha512sums=('04a49455e1489030c520a4bfd2664fa2171e7938d08f2acdbbcb1fda976639fd8b1f0704f2eec89ba59a7b6d118ceaab6ec5a096e40d9085a0895d91ce225245'
            'SKIP'
            '1178062ccfcf7ecc698c64132b3612e73f9c4b0bbfaa668ae2039f3eb4cb2722d0b08a9f45b057da10def7a308d5c8d14c0c644892e7f11092c9cc488c850ab7'
            'be02b7e0df87ac2110ae94116eb505cbdaa2b78fbe0be5178973970299e543ac9d7946cec2f385307d1df13b04925cda46ebc8b2164ebbdb23be1a1f826bd4d8')
validpgpkeys=('E52F07877A5805F9AF4AB0ACD46C5610D06E7001') # ICU Release Robot <icu-robot@unicode.org>

prepare() {
  cd icu/source
  # Required fix for thunderbird 115 to show Calendar and sidebar properly
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1843007
  # https://unicode-org.atlassian.net/browse/ICU-22132
  # patch -Np1 < "../../ICU-22132.patch"

  # fix compile failure on 32-bit platforms
  # https://unicode-org.atlassian.net/browse/ICU-23120
  # https://github.com/unicode-org/icu/pull/3496
  patch -Np1 < "../../icu-77.1-invalid-malloc.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  # Avoid a test suite failure with GCC 13
  # https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1936508.html
  CXXFLAGS+=" -fexcess-precision=fast"

  cd icu/source
  ./configure --prefix=/usr \
	--libdir=/usr/lib32 \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

check() {
  cd icu/source
  make check
}

package() {
  cd icu/source
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr"/{include,share}

  # keep icu-config-32
  find "${pkgdir}/usr/bin" -type f -not -name icu-config -delete
  mv "${pkgdir}/usr/bin"/icu-config{,-32}

  # Install license
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
