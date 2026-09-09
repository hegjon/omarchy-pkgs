# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Bin Jin <bjin@ctrl-d.org>

pkgname=shaderc
pkgver=2026.3
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation'
url='https://github.com/google/shaderc'
arch=('x86_64')
license=('Apache-2.0')
depends=('glibc' 'glslang' 'libgcc' 'libstdc++' 'spirv-tools')
makedepends=('asciidoctor' 'cmake' 'ninja' 'python' 'spirv-headers')
provides=('libshaderc_shared.so')
source=(https://github.com/google/shaderc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('795a2c59c31b11c23e7110fd01fc7ee7c07cadae621c9a11c2df56bc85fcb43c25a1c5504fab36e3df21bad1eb1a2af28872ee9bcf745cd2dec815acd189bcfd')
b2sums=('b78a37d538b1dc6adbd957e378aad4d72b5f461225a63025d8dfa9e21e3fae7c5080639876754f2419627345513e02d9bc62accca5cc1cef7e40bbac836bc7d9')

prepare() {
  cd ${pkgname}-${pkgver}

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -B build \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
    -DSHADERC_SKIP_TESTS=ON \
    -DPYTHON_EXECUTABLE=python \
    -Dglslang_SOURCE_DIR=/usr/include/glslang
  ninja -C build

  cd glslc
  asciidoctor -b manpage README.asciidoc -o glslc.1
}

check() {
  cd ${pkgname}-${pkgver}
  ninja -C build test
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 glslc/glslc.1 -t "${pkgdir}/usr/share/man/man1"

  # Remove unused shaderc_static.pc
  rm "${pkgdir}/usr/lib/pkgconfig/shaderc_static.pc"
}

# vim: ts=2 sw=2 et:
