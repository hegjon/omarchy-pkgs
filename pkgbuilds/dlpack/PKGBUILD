# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=dlpack
pkgver=1.3
pkgrel=1
pkgdesc='Open in-memory tensor structure for sharing tensors among frameworks'
arch=('any')
url='https://dmlc.github.io/dlpack/latest/'
license=('Apache-2.0')
# header-only library
# depends=()
makedepends=('cmake')
_git='https://github.com/dmlc/dlpack'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3d567f885f6c142183afc91a58873b31d0e0b36faa2e45c232b98c74596404f')


build() {
	local cmake_args=(
		-Wno-dev
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-B build
		-S "$pkgname-$pkgver"
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_args[@]}"
	cmake --build build
}

# check() {
# 	./build/mock
# }

package() {
	DESTDIR="$pkgdir" cmake --install build
}
