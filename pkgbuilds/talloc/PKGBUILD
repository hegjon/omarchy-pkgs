# Maintainer:
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=talloc
pkgver=2.5.0
pkgrel=1
pkgdesc="Hierarchical pool based memory allocator with destructors"
arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://talloc.samba.org/"
depends=('glibc' 'libbsd' 'libxcrypt')
makedepends=('python' 'docbook-xsl')
optdepends=('python: for python bindings')
source=(https://www.samba.org/ftp/talloc/talloc-$pkgver.tar.{gz,asc})
sha512sums=('4503e753ddc3bc4c4279a8a1c6a3c623a228bc1991b35f4d25658602dd9688fc6297d0d535ffd193dcb04a83ce9ac8dc35a8accd35fac329b139f59ceba6891f'
            'SKIP')
validpgpkeys=(9147A339719518EE9011BCB54793916113084025) # samba-bugs@samba.org

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   ./configure --prefix=/usr \
     --sysconfdir=/etc/samba \
     --localstatedir=/var \
     --bundled-libraries=NONE \
     --builtin-libraries=replace \
     --enable-talloc-compat1
   make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
}
