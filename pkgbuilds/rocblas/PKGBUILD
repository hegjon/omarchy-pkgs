# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naether.markus@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=rocblas
pkgver=7.2.4
pkgrel=3
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocBLAS/en/latest/index.html'
license=('MIT')
depends=(
  'cblas'
  'glibc'
  'hip-runtime-amd'
  'libgcc'
  'openmp'
  'rocm-core'
  'roctracer'
)
makedepends=(
  'cmake'
  'ninja'
  'gcc-fortran'
  'git'
  'msgpack-cxx'
  'perl-file-which'
  'python'
  'python-joblib'
  'python-msgpack'
  'python-pyaml'
  'python-tensile'
  'python-virtualenv'
  'python-wheel'
  'rocm-cmake'
  'rocm-toolchain'
  'rocm-llvm'
  'rocm-smi-lib'
  'gtest'
)
optdepends=(
  'python-yaml: for rocblas-bench and rocblas-gemm-tune'
  'gtest: for rocblas-bench and rocblas-gemm-tune'
  'rocm-smi-lib: for rocblas-bench and rocblas-gemm-tune'
)
source=("rocm-libraries::git+https://github.com/ROCm/rocm-libraries#tag=rocm-$pkgver")
sha256sums=('b476acbcd0f4017c800e4b05533e6dfb875bde32242729c8df557d4624379623')
options=(!strip)
_dirname="rocm-libraries/projects/$pkgname"
_tensile_dir="rocm-libraries/shared/tensile"

prepare() {
  cd ${_dirname}
  # Add support for gfx103X
  git cherry-pick -n 43a79e3aee2319377f2e69fe943b52a0c29215e8

  # Add support for gfx115X
  git cherry-pick -n 7bc1152aeaeaf9b6c0c7d3450be3d8afc571503b
}

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"

  # Reduce massive spam in log files
  CXXFLAGS+=" -Wno-unused"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -G Ninja
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
    -D CMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
    -D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
    # Enable rocblas-bench and rocblas-gemm-tune
    -D BUILD_CLIENTS_BENCHMARKS=ON
    -D HIP_PLATFORM=amd
    -D BLAS_LIBRARY=cblas
    -D BUILD_WITH_TENSILE=ON
    -D Tensile_LIBRARY_FORMAT=msgpack
    -D Tensile_TEST_LOCAL_PATH="$srcdir/$_tensile_dir"
    -D Tensile_COMPILER=hipcc
    -D BUILD_WITH_PIP=OFF
    # hipblaslt doesn't support all relevant targets
    -D BUILD_WITH_HIPBLASLT=OFF
    -D GPU_TARGETS=$(rocm-supported-gfx)
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
