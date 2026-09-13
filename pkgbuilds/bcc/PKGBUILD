# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=(
  'bcc'
  'bcc-libbpf-tools'
  'bcc-examples'
  'python-bcc'
)
pkgver=0.37.0
pkgrel=1
pkgdesc='BPF Compiler Collection'
arch=('x86_64')
url='https://github.com/iovisor/bcc'
license=('Apache-2.0')
makedepends=(
  'bison'
  'cargo'
  'clang'
  'cmake'
  'flex'
  'git'
  'libbpf'
  'llvm'
  'python'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "git+$url.git#tag=v$pkgver"
  "git+https://github.com/libbpf/bpftool.git"
  "git+https://github.com/libbpf/blazesym.git"
  "git+https://github.com/libbpf/libbpf.git"
  "$pkgbase-define-cmake-components.patch"
  "$pkgbase-libbpf-tools-respect-external-CFLAGS.patch"
)
b2sums=('3cc726502b74d7bcbd7cc7912fe7f6ab2549a2a7c7a863fd3e253be7f3e71ca91f17ad290621c511c0aa238db2f4418b1d4470147521d70f64b5d8225543a44a'
        'SKIP'
        'SKIP'
        'SKIP'
        '0a5ae8d7d99768f43a54013777846a821fa06f7ff04d3d9343f7b093278b508c0b89dc9e74e489af192aa38525c357811fa09785dea81b97bcfd3eb03f88fb81'
        'a26b7f8e17eb60778d8227d2e46d563937f8860629c6134075dfdee50f6836e057da9f2f8281773db46f6b32c74a588c1f03e2a0b753913855f58563be5bcef4')

prepare() {
  cd "$pkgbase"
  git submodule init
  git config submodule.libbpf-tools/bpftool.url ../bpftool
  git config submodule.libbpf-tools/blazesym.url ../blazesym
  git config submodule.src/cc/libbpf.url ../libbpf
  git -c protocol.file.allow=always submodule update \
    libbpf-tools/bpftool \
    libbpf-tools/blazesym \
    src/cc/libbpf

  (
    cd libbpf-tools/bpftool
    git submodule init
    git config submodule.libbpf.url ../../../libbpf
    git -c protocol.file.allow=always submodule update libbpf
  )

  # Patches required to build libbpf-tools
  patch -Np1 < ../$pkgbase-libbpf-tools-respect-external-CFLAGS.patch
  sed -e '/^LIBBPF_BOOTSTRAP_CFLAGS/d' -i libbpf-tools/bpftool/src/Makefile

  # Don't build Python bindings with CMake
  sed -i '/add_subdirectory(python)/d' src/CMakeLists.txt
  sed "s/@REVISION@/$pkgver/" src/python/setup.py.in \
    > src/python/setup.py
  sed "s/@REVISION@/$pkgver/" src/python/bcc/version.py.in \
    > src/python/bcc/version.py

  patch -Np1 < ../$pkgbase-define-cmake-components.patch
}

build() {
  # Nearly all tests invoke sudo
  cmake -S $pkgbase -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev \
    -D CMAKE_USE_LIBBPF_PACKAGE=ON \
    -D ENABLE_LLVM_SHARED=ON \
    -D ENABLE_TESTS=OFF \
    -D RUN_LUA_TESTS=OFF
  cmake --build build

  python -m build --wheel --no-isolation $pkgbase/src/python

  export EXTRA_LDFLAGS=$LDFLAGS
  unset LDFLAGS
  make -C $pkgbase/libbpf-tools \
    USE_BLAZESYM=0
}

package_bcc() {
  pkgdesc+=' (C library)'
  depends=(
    'clang'
    'glibc'
    'libbpf' 'libbpf.so'
    'libelf'
    'libgcc'
    'libstdc++'
    'llvm-libs'
    'xz'
  )
  optdepends=(
    'linux-headers: build modules against the Arch kernel'
    'linux-lts-headers: build modules against the LTS kernel'
    'linux-zen-headers: build modules against the ZEN kernel'
    'linux-hardened-headers: build modules against the HARDENED kernel'
    'luajit: Lua bindings for BCC'
  )
  provides=(
    'libbcc.so'
    'libbcc_bpf.so'
  )

  DESTDIR="$pkgdir" cmake --install build --component core
  DESTDIR="$pkgdir" cmake --install build --component libbcc
  DESTDIR="$pkgdir" cmake --install build --component introspection
}

package_bcc-libbpf-tools() {
  pkgdesc+=' (Tools)'
  provides=('bcc-tools')
  conflicts=('bcc-tools')
  replaces=('bcc-tools')
  depends=(
    'glibc'
    'libelf'
    'zlib'
  )

  make -C $pkgbase/libbpf-tools install \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    USE_BLAZESYM=0
}

package_bcc-examples() {
  pkgdesc+=' (Examples)'
  depends=(
    'python'
    'python-bcc'
  )

  DESTDIR="$pkgdir" cmake --install build --component examples
}

package_python-bcc() {
  pkgdesc+=' (Python bindings)'
  depends=(
    'bcc'
    'python'
  )
  optdepends=(
    'python-netaddr: Network address representation and manipulation'
    'python-pyroute2: Netlink and Linux network configuration'
  )

  python -m installer --destdir="$pkgdir" $pkgbase/src/python/dist/*.whl
}
