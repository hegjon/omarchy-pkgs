# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=spirv-tools
pkgver=1.4.357.0
pkgrel=1
epoch=1
pkgdesc="API and commands for processing SPIR-V modules"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  libstdc++
  glibc
  sh
)
makedepends=(
  cmake
  git
  ninja
  python
  spirv-headers
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/SPIRV-Tools#tag=vulkan-sdk-$pkgver")
b2sums=('551c6621a4598c1134d25f50b49df013a393dd4d6d142ccebd4a496495994afbdd98a8b637a9bdca0acee3a933c73049a2cdd8b37371f7567c9d22cf4724d06c')

build() {
  local cmake_options=(
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D SPIRV-Headers_SOURCE_DIR=/usr
    -D SPIRV_TOOLS_BUILD_STATIC=OFF
    -D SPIRV_WERROR=OFF
  )

  cmake -S SPIRV-Tools -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
