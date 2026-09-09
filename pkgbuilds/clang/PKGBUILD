# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=clang
pkgver=22.1.8
pkgrel=1
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm-libs' 'gcc' 'compiler-rt' 'libgcc' 'libxml2')
makedepends=("llvm=$pkgver" 'cmake' 'ninja' 'python-sphinx' 'python-myst-parser')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm: referenced by some clang headers')
checkdepends=('clang')
provides=("clang-analyzer=$pkgver" "clang-tools-extra=$pkgver")
conflicts=('clang-analyzer' 'clang-tools-extra')
replaces=('clang-analyzer' 'clang-tools-extra')
options=(!lto)
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig}
        0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us.patch
        enable-fstack-protector-strong-by-default.patch)
sha256sums=('922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888'
            'SKIP'
            '6f3cc7a4847e03d16ed90341bb71fec98427763ff2351f5344b2ca2ce62a604c'
            '93713470709ad0fbcf04aad29adb269478027c25e5a45e0ef3ca807dff409c12')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

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
  cd llvm-project-$pkgver.src/clang
  mkdir build
  patch -Np2 -i "$srcdir/enable-fstack-protector-strong-by-default.patch"

  # Revert always linking against libamath when -fveclib=ArmPL
  patch -Np2 -i "$srcdir/0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us.patch"
}

build() {
  cd llvm-project-$pkgver.src/clang/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_DEFAULT_PIE_ON_LINUX=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DENABLE_LINKER_BUILD_ID=ON
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_CLANG_TOOLS_EXTRA_SOURCE_DIR="$srcdir/llvm-project-$pkgver.src/clang-tools-extra"
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_DOCS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_THIRD_PARTY_DIR="$srcdir/llvm-project-$pkgver.src/third-party"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
    -DLLVM_PACKAGE_BUGREPORT=https://gitlab.archlinux.org/archlinux/packaging/packages/clang/-/issues
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-project-$pkgver.src/clang/build
  LD_LIBRARY_PATH=$PWD/lib ninja check-clang{,-tools}
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package() {
  cd llvm-project-$pkgver.src/clang/build

  DESTDIR="$pkgdir" ninja install-distribution
  install -Dm644 "$srcdir/llvm-project-$pkgver.src/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/clang{,-tools}/html/{_sources,.buildinfo}

  # Move scanbuild-py into site-packages and install Python bindings
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages"
  mv "$pkgdir"/usr/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"
  cp -a ../bindings/python/clang "$pkgdir/$site_packages/"

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/clang/"
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|libexec|lib/clang|' \
    "$pkgdir/usr/bin/scan-build" \
    "$pkgdir/$site_packages/libscanbuild/analyze.py"

  # Compile Python scripts
  _python_optimize "$pkgdir/usr/share" "$pkgdir/$site_packages"

  # Move bash completion
  local bash_completion_destdir="$pkgdir/usr/share/bash-completion/completions"
  install -d $bash_completion_destdir
  mv "$pkgdir/usr/share/clang/bash-autocomplete.sh" "$bash_completion_destdir/clang"
}

# vim:set ts=2 sw=2 et:
