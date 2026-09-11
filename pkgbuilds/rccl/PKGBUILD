# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contriubtor: Markus Näther <naetherm@informatik.uni-freiburg.de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rccl
pkgver=7.2.4
pkgrel=1
pkgdesc="ROCm Communication Collectives Library"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rccl/en/latest/index.html'
license=('BSD-3-Clause')
depends=('rocm-core' 'glibc' 'libgcc' 'hip-runtime-amd' 'rocm-smi-lib')
makedepends=('git' 'cmake' 'rocm-cmake' 'rocm-llvm' 'hipify-clang' 'python')
source=(
  "${pkgname}::git+https://github.com/ROCm/rccl#tag=rocm-$pkgver"
  "${pkgname}-json::git+https://github.com/nlohmann/json.git"
  "${pkgname}-mscclpp::git+https://github.com/microsoft/mscclpp.git"
)
sha256sums=('c47a838050a0188258fc318a82013d400fcaba661a2a58300bff8e51f77e20ec'
            'SKIP'
            'SKIP')
options=(!lto)

prepare() {
  cd "$pkgname"
  git submodule init

  git config submodule."ext-src/json".url "${srcdir}/${pkgname}"-json
  git config submodule."ext-src/mscclpp".url "${srcdir}/${pkgname}"-mscclpp

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export CXX=/opt/rocm/llvm/bin/amdclang++
  export CC=/opt/rocm/llvm/bin/amdclang
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  CXXFLAGS+=" -fcf-protection=none"
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_TOOLCHAIN_FILE="$srcdir/$pkgname"/toolchain-linux.cmake
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D ENABLE_MSCCL_KERNEL=OFF
    -D ENABLE_MSCCLPP=OFF
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
