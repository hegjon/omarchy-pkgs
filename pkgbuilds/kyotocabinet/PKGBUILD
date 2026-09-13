# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Duscheleit <jinks@archlinux.us>
# Contributor: Joaquim Pedro (osmano807) <osmano807@gmail.com>

pkgname=kyotocabinet
pkgver=1.2.80
pkgrel=2
pkgdesc="a modern implementation of DBM in C++"
arch=('x86_64')
url="https://dbmx.net/kyotocabinet"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
source=("https://dbmx.net/${pkgname}/pkg/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9fe0a92c9a76db5ce06ef4d5a551c05930f2a9c065ab695b030fdaf45692bfe88d91f1b75791f50d0772c699567744cd74f3ef407172874d4bba467989d54328')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-opt
  make
}

package() {
  cd $pkgname-$pkgver

  make install DESTDIR="$pkgdir/"
}
