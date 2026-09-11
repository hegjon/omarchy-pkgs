# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=rocm-toolchain
pkgver=0.4.0
pkgrel=2
pkgdesc="Scripts for ROCm packaging"
arch=('any')
url="https://gitlab.archlinux.org/tpkessler/rocm-toolchain"
license=('GPL-3.0-or-later')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('7eb17d4ccdf8fc19fcb51894ef9166e0236d8bb30ab7d93383be807937f36c4f')

package() {
	cd $pkgname
	install -Dm755 rocm-supported-gfx "$pkgdir"/usr/bin/rocm-supported-gfx
}
