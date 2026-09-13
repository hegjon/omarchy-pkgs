# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  hydro <hydro@freenet.de>

pkgname=libmediainfo
pkgver=26.05
pkgrel=2
pkgdesc='Shared library for MediaInfo'
arch=(x86_64)
url='https://mediaarea.net'
license=(BSD-2-Clause)
depends=(
  glibc
  curl
  glib2
  libmms
  libzen
  libgcc
  libstdc++
  tinyxml2
  graphviz
  zlib
)
source=("$pkgname-$pkgver.tar.xz::https://mediaarea.net/download/source/libmediainfo/$pkgver/libmediainfo_$pkgver.tar.xz"
         graphviz-13.patch)
sha512sums=('8eef2b1214d2b512c8d4483f4a8a967cd05f065cb7dd0ec9ac09b2989a2bce0f60a897a7b154e90f2d6f9e3b53ac8bebe7e9c577dfe2afdb37686c027b3a97a7'
            'c5d9d5f4cb1a22e1e7fe9d08f6cb1c60fb25a74a653473d9f441a8c936959fdf770b7e9e200683ed884351bd825d3e7de73556186e9b39668285cc93d414b336')
b2sums=('2c2a6e9a1f5cd9daaaa3575a99477f4d1bfebaa193b4d72f2f25288c0afa2ebe1e9e15ff38d01a09c882aac28b2f13593960e6df738a97eee0e162143c8ffec3'
        'a26d3207609bf16f66ef12ee54104af0b8660288abb2f9be6c73eb314fa347fd9f38cb15215ce23dbc63fe0a2525437f330a4bee2efd5b702ee7dbdb5b3b8660')

prepare() {
  patch -d MediaInfoLib -p1 < graphviz-13.patch # Fix build with GraphViz 13
}

build() {
  cd MediaInfoLib/Project/GNU/Library

  ./autogen.sh

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-libcurl \
    --with-libmms \
    --with-libtinyxml2 \
    --with-graphviz

  make
}

package() {
  cd MediaInfoLib/Project/GNU/Library

  make DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/MediaInfoLib/LICENSE"
}
