# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=16.0.0
pkgrel=1
pkgdesc='Graph visualization software'
url='https://www.graphviz.org/'
license=('EPL')
arch=('x86_64')
depends=('libltdl' 'gd' 'librsvg' 'ghostscript' 'pango' 'gts' 'gsfonts')
makedepends=('swig' 'mono' 'guile' 'lua' 'perl' 'python' 'r' 'tk' 'qt6-base')
optdepends=('mono: sharp bindings'
            'guile: guile bindings'
            'lua: lua bindings'
            'perl: perl bindings'
            'python: python bindings'
            'r: r bindings'
            'tcl: tcl bindings'
            'qt6-base: gvedit'
            'xterm: vimdot')
source=("https://gitlab.com/graphviz/graphviz/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('028f199ee3c77781360a600bac2e1fa56797011188772a2c8ea45be4ca7dde7b')
b2sums=('e049c488764207156a3c79af5d3827bc537683fc52f89fa0569deec93aa06127f7f4a1a62da70393a3f98d890a21cb6dd5d08bed6fba89874fd84cec78b89bac')
install='graphviz.install'

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh NOCONFIG
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export LIBPOSTFIX=/
	export CXXFLAGS+=' -fPIC -fpermissive'

	./configure --prefix=/usr --enable-python3=yes --disable-python --enable-lefty
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# fix symlink to symlink that doesn't get picked up by makepkg's zipman
	ln -s gv2gxl.1.gz "${pkgdir}"/usr/share/man/man1/dot2gxl.1.gz
	rm "${pkgdir}"/usr/share/man/man1/dot2gxl.1

	# Deduplicates TCL libraries
	cd "${pkgdir}/usr/lib/tcl8.6"
	rm -fr graphviz
	ln -s ../graphviz/tcl graphviz
}
