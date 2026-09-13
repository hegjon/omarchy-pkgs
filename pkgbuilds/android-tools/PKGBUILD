# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=android-tools
pkgver=37.0.0
_tag=${pkgver} # https://github.com/nmeum/android-tools sometimes carries extra patch version on top of the upstream versioning
pkgrel=5
pkgdesc='Android platform tools'
arch=(x86_64)
url='https://developer.android.com/tools'
license=('Apache-2.0 AND BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT AND libselinux-1.0')
depends=(abseil-cpp brotli fmt glibc libgcc libstdc++ libusb lz4 pcre2 protobuf zlib zstd)
makedepends=(cmake git go gtest ninja)
optdepends=('python: {mk,unpack_,repack_}bootimg and mkdtboimg support'
	    'android-udev: optional additional device udev rules')
source=(https://github.com/nmeum/android-tools/releases/download/$_tag/android-tools-$_tag.tar.xz
        protobuf-36-absl-log-macros.patch)
sha256sums=('2725d09f892a3a38e534429f47a321f58ecf6a3169caa42c915fb2cb7d46be0e'
            'ba52b2227c093b56290f07b2be8238201a4e6a2de6de9ba54c3a82e4d6c890a0')

prepare() {
	cd "android-tools-${_tag}"

	# Keep adb's LOG/VLOG macros from being overwritten by protobuf 36's Abseil headers.
	patch -Np1 -i ../protobuf-36-absl-log-macros.patch
}

build() {
	cd "android-tools-${_tag}"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DCMAKE_C_FLAGS="$CFLAGS" \
		-G Ninja -S . -B build
	cmake --build build
}

package() {
	cd "android-tools-${_tag}"

	DESTDIR="$pkgdir" ninja -C build install

	install -Dm644 vendor/selinux/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/libselinux.txt"
	install -Dm644 vendor/fmtlib/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
	install -Dm644 vendor/avb/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
}
