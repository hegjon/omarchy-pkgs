# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocprim
pkgver=7.2.4
pkgrel=1
pkgdesc='Header-only library providing HIP parallel primitives'
arch=('any')
url='https://rocm.docs.amd.com/projects/rocPRIM/en/latest/index.html'
license=('MIT')
depends=('rocm-core' 'hip-runtime-amd')
makedepends=('cmake' 'git' 'rocm-cmake' 'rocm-toolchain' 'rocm-llvm')
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('50a4090b4ad18b34c375f666e5f71816cf55f89bc2175dc3eba9a7b80f65a15d')
_dirname="rocm-libraries-rocm-$pkgver/projects/$pkgname"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  export CC=amdclang
  export CXX=amdclang++
  CXXFLAGS+=" -fcf-protection=none"
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_TOOLCHAIN_FILE="$srcdir/$_dirname"/toolchain-linux.cmake
    -D AMDGPU_TARGETS=$(rocm-supported-gfx)
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
