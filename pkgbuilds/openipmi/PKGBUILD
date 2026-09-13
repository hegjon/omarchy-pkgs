# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=openipmi
_pkgname=OpenIPMI
pkgver=2.0.37
pkgrel=3
pkgdesc='Full-function IPMI (Intelligent Platform Management Interface) system'
url='http://openipmi.sourceforge.net/'
arch=('x86_64')
license=('LGPL2.1')
makedepends=('python' 'swig')
depends=('popt' 'ncurses' 'net-snmp' 'glib2' 'gdbm' 'libedit')
optdepends=('python: bindings')
source=("https://downloads.sourceforge.net/project/${pkgname}/${_pkgname}%202.0%20Library/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ef959ece52f073c108a84911f0aeff421c9408f70b7dacf286ec5fdb023e281d3e97b425ac2c3c70bdfebfafda61ba923c8c052da52448d26d5fcf5e4d1c764a')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed \
		-e '/Requires:/s/pthread//' \
		-e '/Libs:/s/$/ -lpthread/' \
		-i OpenIPMIpthread.pc.in
	autoreconf -fiv
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	PYTHONWARNINGS=ignore ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install-exec
	make DESTDIR="${pkgdir}" install
	install -Dm644 doc/IPMI.pdf "${pkgdir}/usr/share/doc/${pkgname}/IPMI.pdf"
}
