# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang18
pkgver=18.1.8
pkgrel=2
pkgdesc="C language family frontend for LLVM 18"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm18-libs' 'gcc' 'compiler-rt18')
makedepends=('llvm18' 'cmake' 'ninja' 'python-sphinx' 'python-myst-parser')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm18: referenced by some clang headers')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/clang-$pkgver.src.tar.xz{,.sig}
        $_source_base/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig}
        clang-disable-float128-diagnostics-for-device-compilation.patch
        support-__GCC_-CON-DE-STRUCTIVE_SIZE.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('5724fe0a13087d5579104cedd2f8b3bc10a212fb79a0fcdac98f4880e19f4519'
            'SKIP'
            'e58877fcd95ed106824bd1a31276dd17ed0c53adcd60ca75289eac0654f0a7f1'
            'SKIP'
            'f68cf90f369bc7d0158ba70d860b0cb34dbc163d6ff0ebc6cfa5e515b9b2e28d'
            'SKIP'
            '59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837'
            'SKIP'
            'b76b810f3d3dc5d08e83c4236cb6e395aa9bd5e3ea861e8c319b216d093db074'
            'SKIP'
            '94a3d4df2443f9dc9e256e6c0c661ff4a4ca4f34a5ca351f065511b9694faf2a'
            '8832b4ee02fe8a0e57fca608288242f80e348ee9b60be3eb0069c8b91a42fbf4'
            'ef319e65f927718e1d3b1a23c480d686b1d292e2a0bf27229540964f9734117a')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
        continue
        ;;
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
  cd clang-$pkgver.src
  mkdir build
  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/extra
  patch -Np2 -i ../enable-fstack-protector-strong-by-default.patch
  patch -Np2 -i ../clang-disable-float128-diagnostics-for-device-compilation.patch
  patch -Np2 -i ../support-__GCC_-CON-DE-STRUCTIVE_SIZE.patch
}

build() {
  cd clang-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm18
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm18
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_CONFIG=/usr/lib/llvm18/bin/llvm-config
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_DOCS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
    -DLLVM_INCLUDE_TESTS=OFF
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd clang-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja clang-check
}

package() {
  cd clang-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir"/usr/lib/{llvm18/lib/,}libclang-cpp.so.18.1
  ln -s ../../libclang-cpp.so.18.1 "$pkgdir/usr/lib/llvm18/lib/libclang-cpp.so.18.1"
  ln -s llvm18/lib/libclang.so.18.1 "$pkgdir"/usr/lib/libclang.so.18.1
}

# vim:set ts=2 sw=2 et:
