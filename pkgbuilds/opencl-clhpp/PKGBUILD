# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=opencl-clhpp
pkgver=2026.05.29
pkgrel=1
pkgdesc='OpenCL C++ header files'
arch=('any')
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('Apache-2.0')
makedepends=('cmake' 'doxygen' 'graphviz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
sha256sums=('fafb4fd202d113992c009d46e6358e70076167e62a5baeb377fe813033a2655e')
depends=('opencl-headers')

build() {
  cmake -B build -S OpenCL-CLHPP* \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=Off \
    -DBUILD_DOCS=On \
    -DBUILD_TESTING=Off 

  make -C build docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
  cp -r build/docs/html/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -D -m644 OpenCL-CLHPP*/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
