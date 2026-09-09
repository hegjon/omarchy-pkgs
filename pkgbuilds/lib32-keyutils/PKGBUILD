# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

_pkgbasename=keyutils
pkgname=lib32-$_pkgbasename
pkgver=1.6.3
pkgrel=4
pkgdesc='Linux Key Management Utilities (32-bit)'
arch=('x86_64')
url='https://www.kernel.org/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('lib32-glibc' 'lib32-krb5' "${_pkgbasename}")
makedepends=('git' 'gcc-multilib')
validpgpkeys=('A86E54B0D5E1B4E0AB7C640FFBB7576BA7CB0B6B') # David Howells <dhowells@redhat.com>
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git#tag=v${pkgver}?signed")
sha256sums=('fb172bd1100b07e5ea3f4ba899ca369fd25dcd0ccadee88bd162a8e431e78d26')
sha512sums=('1d7fa66cfa46f29e2a0e9c79b69a206986e437900b99c133e0be23bf8ec8f46a23064791a011f49189cf63c0e40c9453fadca83b261208a0b1c38e0e0680f5e2')

build() {
  cd "${_pkgbasename}"
  
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  sed -i -e 's/^\(USR\)\?LIBDIR\s*:=.*$/\1LIBDIR=\/usr\/lib32/' Makefile
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${_pkgbasename}"
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,{s,}bin}
}
