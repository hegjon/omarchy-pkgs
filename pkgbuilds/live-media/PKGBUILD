# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=live-media
pkgver=2025.05.24
pkgrel=1
pkgdesc='Set of C++ libraries for multimedia streaming'
url='http://live555.com/liveMedia'
arch=('x86_64')
license=('LGPL')
depends=('gcc-libs' 'openssl')
source=(http://live555.com/liveMedia/public/live.$pkgver.tar.gz)
sha256sums=('e6185902c4bfe9235067a0bc80ec9a5f8a95956d9d07525ce169f3f9753afb0a')
sha512sums=('4b2053ac83cceedf05dd778d56ee63b77e41a8a3dac086365bf8b91a7c9758c2eedc6d6ee5468fac3cec8e33b7b070cfa7401a4ec37f87346c940f56d4af63ac')

prepare() {
  cd live
  find . -name Makefile.head | xargs sed -e 's|/local||g' -i # Fix prefix
}

build() {
  cd live
  sed -E 's|(-DSOCKLEN_T=socklen_t)|\1 -fPIC -DRTSPCLIENT_SYNCHRONOUS_INTERFACE=1|g' -i config.linux-with-shared-libraries
  ./genMakefiles linux-with-shared-libraries
  CXXFLAGS+=' -std=c++20' \
  make
}

package() {
  cd live
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
