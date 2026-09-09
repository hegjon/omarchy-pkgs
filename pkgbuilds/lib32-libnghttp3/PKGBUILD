# Maintainer: Christian Hesse <eworm@archlinux.org>

pkgname=lib32-libnghttp3
pkgver=1.18.0
pkgrel=1
pkgdesc='HTTP/3 library written in C (32-bit)'
url='https://github.com/ngtcp2/nghttp3'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' 'libnghttp3')
makedepends=('git')
provides=('libnghttp3.so')
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
source=("git+https://github.com/ngtcp2/nghttp3.git?signed#tag=v${pkgver}"
        'git+https://github.com/ngtcp2/munit.git'
        'git+https://github.com/ngtcp2/sfparse.git')
sha256sums=('5e0c2de58014f949291cf70cba926c6435658652d681eee085226274b26e5062'
            'SKIP'
            'SKIP')

prepare() {
  cd nghttp3/

  git config --file=.gitmodules submodule.tests/munit.url ../munit/
  git config --file=.gitmodules submodule.lib/sfparse.url ../sfparse/

  git submodule init
  git -c protocol.file.allow=always submodule update

  autoreconf -i
}

build() {
  cd nghttp3/

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

check() {
  cd nghttp3/

  make check
}

package() {
  cd nghttp3/

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{include,share}
  install -D -m0644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
