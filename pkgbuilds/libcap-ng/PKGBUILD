# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgbase=libcap-ng
pkgname=(
  libcap-ng
  python-capng
)
pkgver=0.9.5
pkgrel=1
pkgdesc='A library for Linux that makes using posix capabilities easy'
arch=(x86_64)
url='https://people.redhat.com/sgrubb/libcap-ng/'
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(glibc)
makedepends=(
  bash-completion
  python
  swig
)
source=(
  https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('eca44c680ea6104c59591ee19ae9136ed1f4d0437877a1c16f5fb5d546466ff99d52fe45daa081bc6dde15abbb3902528b7bf6fade4845d0c13756d426e21db7')
b2sums=('ddfe7b6975747963a2eb53485481c55f5638a06f119260e34619336445321d41b1531e4b78593aab9267a463e08641eb666f58ca6dc19fabf776995a4579e072')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $pkgbase-$pkgver
  # make stupid autotools happy -_-
  touch NEWS
  autoreconf -fiv
}

build() {
  local configure_options=(
    --enable-static=no
    --prefix=/usr
    --sysconfdir=/etc
    --with-python3
    --without-python
  )

  cd $pkgbase-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C $pkgbase-$pkgver
}

package_libcap-ng() {
  provides=(
    libcap-ng.so
    libdrop_ambient.so
  )

  make DESTDIR="$pkgdir" install -C $pkgbase-$pkgver

  (
    cd "$pkgdir"
    _pick python-capng usr/lib/python*
  )
}

package_python-capng() {
  pkgdesc+=' (Python bindings)'
  depends+=(
    libcap-ng libcap-ng.so
    python
  )
  provides=(
    python-libcap-ng
  )

  mv -v python-capng/* "$pkgdir"
}

# vim: ts=2 sw=2 et:
