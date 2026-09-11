# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=spirv-llvm-translator
pkgver=22.1.6
pkgrel=1
pkgdesc="LLVM <-> SPIR-V converter for compilers targeting SPIR-V"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(NCSA)
depends=(
  glibc
  libstdc++
  llvm-libs
  spirv-tools
)
makedepends=(
  cmake
  git
  llvm
  ninja
  spirv-headers
)
checkdepends=(
  clang
  python
)
source=(
  git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator#tag=v$pkgver
)
b2sums=('010ef015531b9215690724cabac9584760bf20ecad58848cb202aa2b44a802c2722c3d9abb8efc2cff35a2ba280c1d9d0958cd59e7a11908d2da05a8b1eb4fd2')

prepare() {
  cd SPIRV-LLVM-Translator

  # Fix tests
  git cherry-pick -n 30258ee35493b5355a5c6df0655f91eff4217685
  git cherry-pick -n 8189551551d2bdb2946a69a6dfb3fa199c7dedc8
  git cherry-pick -n 13f1c79e6272d49b163dc983601d7fe9c0d3022f
  git cherry-pick -n bf469923a25d484620bcadd9bf2abeceaeae1980
  git cherry-pick -n 7de094bda017e2aa88d347a8d58ea5a1200e1bc1
  git cherry-pick -n 28cfd130468a0727816e856305f3abfdaeb5cd97
  git cherry-pick -n 38a315ed3cc0d9148f2b65198bf159e3f4fe155a
  git cherry-pick -n ce41b712b88b468044d5e6f2e48a898eb8a2a660
}

build() {
  local cmake_options=(
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_SKIP_RPATH=ON
    -D LLVM_CONFIG=llvm-config
    -D LLVM_EXTERNAL_LIT=/usr/bin/lit
    -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv
    -D LLVM_LIBDIR_SUFFIX=
    -D LLVM_SPIRV_ENABLE_LIBSPIRV_DIS=ON
    -D LLVM_SPIRV_INCLUDE_TESTS=ON
    -W no-author
  )

  cmake -S SPIRV-LLVM-Translator -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  # Does not use ctest-compatible targets
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 SPIRV-LLVM-Translator/LICENSE.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
