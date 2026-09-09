# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgname=cpuinfo
_commit=ea6b9f1bb6e1001d8b21574d5bc78ddef62e499d
pkgver=r843.ea6b9f1
pkgrel=1
pkgdesc="CPU INFOrmation library"
arch=("x86_64")
url="https://github.com/pytorch/cpuinfo"
license=("BSD-2-Clause")
depends=(
	glibc
)
makedepends=(
	git
	cmake
	ninja
	gtest
)
source=("${pkgname}::git+${url}#commit=$_commit")
sha256sums=('879843097951d76bd8b234332ff438e2a0959e2429ddf9e74612a1558292465b')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	local cmake_args=(
		-Wno-dev
		-G Ninja
		-B build
		-S ${pkgname}
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D USE_SYSTEM_GOOGLETEST=ON
		-D BUILD_SHARED_LIBS=ON
	)
	cmake "${cmake_args[@]}"
	cmake --build build
}

check() {
	cd build
	ctest .
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	# Delete google benchmark
	find "${pkgdir}" -name "*benchmark*" -exec rm -rf {} +
	# cpuinfo doesn't use cmake
	rmdir "${pkgdir}"/usr/lib/cmake
	install -Dm644 ${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
