# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters
pkgver=2.2.1
pkgrel=2
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
# keep poppler for pdftoppm
depends=('libcups' 'libexif' 'pdfio' 'libjxl' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2'
         'fontconfig' 'glibc' 'dbus')
makedepends=(
	'ghostscript' 
#        'mupdf-tools' ???
)
checkdepends=('ttf-dejavu') # ttf-dejavu for make check
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        libcupsfilters-PR167.patch::https://github.com/OpenPrinting/libcupsfilters/pull/167.patch
        )
sha256sums=('0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860'
            'fa77ba778dcbea8826edcf87c4d022a11c073d288b39a1eaf06e0eaf3376f525')

prepare() {
  cd "$pkgname"-$pkgver
  # https://github.com/OpenPrinting/libcupsfilters/issues/209
  patch -Np1 -i ../libcupsfilters-PR167.patch
  autoreconf -vfi
}

build() {
  cd "$pkgname"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  make
}

check() {
  cd "$pkgname"-$pkgver
  make check
}

package() {
  cd "$pkgname"-$pkgver
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
