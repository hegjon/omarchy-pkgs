# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-ust2.12
pkgver=2.12.10
pkgrel=2
pkgdesc='LTTng user space tracing libraries for LTTng'
arch=(x86_64)
url=https://lttng.org/
license=(
  LGPL-2.1-only
  GPL-2.0-only
  MIT
)
depends=(
  glibc
  libnuma.so
  liburcu
  python
)
makedepends=(
  git
)
conflicts=(lttng-ust)
source=(git+https://github.com/lttng/lttng-ust.git?signed#tag=v${pkgver})
b2sums=('650d4e31c1076745525a289b57b04e4de6bfef87de57f2c8e9dc724bb5c36d9071f8e8c16279724cdfbe4785d4a34fa62b47568702b4c65af03e919a9fd0a879')
validpgpkeys=(2A0B4ED915F2D3FA45F5B16217280A9781186ACF) # Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

prepare() {
  cd lttng-ust
  autoreconf -fiv
}

build() {
  cd lttng-ust
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-man-pages
  make
}

package() {
  cd lttng-ust
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
