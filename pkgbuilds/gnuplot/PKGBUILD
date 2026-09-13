# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase=gnuplot
pkgname=(gnuplot
         gnuplot-demos)
pkgver=6.0.5
pkgrel=1
pkgdesc='Plotting package which outputs to X11, PostScript, PNG, GIF, and others' 
arch=(x86_64)
url='http://www.gnuplot.info'
license=(LicenseRef-Gnuplot)
depends=(cairo
         gd
         glib2
         glibc
         gtk3
         libcaca
         libcerf
         libgcc
         libstdc++
         libwebp
         libx11
         lua
         pango
         qt6-5compat
         qt6-base
         qt6-svg
         readline
         wxwidgets-common
         wxwidgets-gtk3) 
makedepends=(emacs
             git
             qt6-tools
             texlive-latexextra)
source=(git+https://git.code.sf.net/p/gnuplot/gnuplot-main#tag=$pkgver)
sha256sums=('5e233554287cb0cf301a80161e626bf0be68f73d6b2a5bedcde1f0416c3cca1a')

prepare() {
  cd gnuplot-main
  ./prepare
}

build() {
  cd gnuplot-main

  MAKEINFO=/usr/bin/makeinfo \
  ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --with-bitmap-terminals \
              --with-wx-single-threaded \
              --with-caca \
              --with-texdir=/usr/share/texmf/tex/latex/gnuplot
  make pkglibexecdir=/usr/bin
}

package_gnuplot() {
  cd gnuplot-main
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C demo

  install -Dm644 Copyright -t "$pkgdir"/usr/share/licenses/$pkgname

  rm -f "$pkgdir"/usr/share/texmf-dist/ls-R
}

package_gnuplot-demos() {
  pkgdesc='Demos for gnuplot'
  depends=(gnuplot)

  install -Dm644 gnuplot-main/demo/*.{dem,dat} -t "$pkgdir"/usr/share/gnuplot/demos
}
