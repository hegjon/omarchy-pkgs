# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=rocsolver
pkgver=7.2.4
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocSOLVER/en/latest/index.html'
license=('BSD-2-Clause')
depends=(
    'glibc'
    'hip-runtime-amd'
    'libgcc'
    'rocblas'
    'rocm-core'
    'rocsparse'
)
makedepends=(
    'fmt'
    'python-pyaml'
    'rocm-cmake'
    'rocm-toolchain'
)
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('50a4090b4ad18b34c375f666e5f71816cf55f89bc2175dc3eba9a7b80f65a15d')
options=(!lto)
_dirname="rocm-libraries-rocm-$pkgver/projects/$pkgname"

build() {
    # Compile source code for supported GPU archs in parallel
    export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
    export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
    # -fcf-protection is not supported by HIP, see
    # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
    local cmake_args=(
        -Wno-dev
        -S "$_dirname"
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc
        -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
        -D CMAKE_INSTALL_PREFIX=/opt/rocm
        -D ROCSOLVER_EMBED_FMT=ON
        # gfx950 lacks support for 128 bit atomics
        -D AMDGPU_TARGETS=$(rocm-supported-gfx -e gfx950)
    )
    cmake "${cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
