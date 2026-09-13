# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
pkgname=rocprofiler-register
pkgver=7.2.4
pkgrel=1
pkgdesc='Helper library for the ROCprofiler (v2) library'
arch=('x86_64')
url='https://github.com/ROCm/rocm-systems'
license=('MIT')
depends=('rocm-core' 'glibc' 'libgcc' 'fmt' 'google-glog')
makedepends=('cmake' 'rocm-cmake')
source=("rocm-$pkgver.tar.gz::$url/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('817f9c136125b8d162757a18cdc25b18b1efeb8ef36a948c85e4a672fd149de5')
_dirname="rocm-systems-rocm-$pkgver/projects/$pkgname"

prepare() {
  # Remove cpack packaging
  sed -i '116d' "$srcdir/$_dirname/CMakeLists.txt"
  # find_package() calls on global scope
  sed -i 's/add_subdirectory(external)/find_package(fmt REQUIRED)\nfind_package(glog REQUIRED)/' \
    "$srcdir/$_dirname/CMakeLists.txt"
}

build() {
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D ROCPROFILER_REGISTER_BUILD_GLOG=OFF
    -D ROCPROFILER_REGISTER_BUILD_FMT=OFF
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
