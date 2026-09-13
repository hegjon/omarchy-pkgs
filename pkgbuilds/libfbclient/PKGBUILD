# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Carlier Laurent <lordheavym@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=libfbclient
pkgver=5.0.4
pkgrel=1
pkgdesc='Client library for Firebird'
arch=(x86_64)
url='https://www.firebirdsql.org'
license=(MPL-1.1 Interbase-1.0)
depends=(
  sh
  glibc
  libgcc
  libtommath
)
makedepends=(
  git
  editline
  libtomcrypt
  unzip
  cmake
)
options=(!lto) # segfaults with LTO
source=("$pkgname::git+https://github.com/FirebirdSQL/firebird#tag=v$pkgver")
sha512sums=('cd9093b0f3fc4120ac9cfcef1647c0c49bdba6fae73ea22ad0827460a5d5f3296c5ca51934ea351727a228f28558062bc0f3974c9c776dabddfda0db93f0a95d')
b2sums=('6fe5b3cb50d58a493c88f53ce68aab6d65bd0afbbdf829f89a405b4b9c423abe9e2ae8e677f66c0fbf4c41a10d617b4ef0359b72e9c7fcebeb6f45e6b0a362cf')


prepare() {
  cd "$pkgname"

  # Ensure system libs are used
  rm -r extern/{editline,libtommath,libtomcrypt,zlib}

  autoreconf -vfi
}

build() {
  cd "$pkgname"

  local configure_options=(
    --prefix=/usr
    --without-fbsbin
    --without-fbconf
    --without-fbdoc
    --without-fbsample
    --without-fbsample-db
    --without-fbintl
    --without-fbmisc
    --without-fbhelp
    --without-fbsecure-db
    --with-fbmsg=/usr/share/firebird
    --without-fblog
    --without-fbglock
    --without-fbplugins
    --without-fbtzdata
    --with-system-editline
  )

  ./configure "${configure_options[@]}"

  make
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir"/usr/{bin,share/{firebird,licenses/$pkgname}}

  cp -R gen/Release/firebird/{lib,include} "$pkgdir"/usr
  rm -f "$pkgdir"/usr/lib/{libdecFloat.a,libedit.a,libre2.a}

  install -m644 gen/Release/firebird/*.msg "$pkgdir"/usr/share/firebird
  install -m755 gen/Release/firebird/bin/fb_config "$pkgdir"/usr/bin
  install -m644 doc/license/README.license.usage.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 doc/license/IDPL.txt "$pkgdir"/usr/share/licenses/$pkgname/IDPL.txt
}
