# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.14.6.p1
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=(x86_64)
url='https://github.com/rapidfuzz/RapidFuzz'
license=(MIT)
depends=(
  glibc
  libgcc
  libstdc++
  python
)
makedepends=(
  git
  python-build
  python-installer
  cython
  python-scikit-build-core
  rapidfuzz-cpp
)
checkdepends=(
  python-hypothesis
  python-pandas
  python-pytest
)
optdepends=(python-numpy)
source=(
  "$pkgname::git+$url#tag=v$(echo $pkgver | sed 's/\.p/-/')"
  'github.com-taskflow-taskflow::git+https://github.com/taskflow/taskflow'
  remove-version-constraints.patch
)
sha512sums=('f1e700715e61330fce9fe0af56daa4f4d8ad3a285c680cd614084a0955d2b5e924f8947aa8763b135e4e49dfdae01a529ca73d5f3428df132d1f5e01cd7a6fdc'
            'SKIP'
            '37a0c5921d828dd6bfa0b48121ead76282e5ecfb55a7a8b1e972f43ae39cdf6145728d3be8e4f434d0a70ec0d7f0a3d681d7311a578b853c6dc734bd900c1ed1')
b2sums=('eda67e3d6313e3779d7620397f1d2330889be81a4e5eb9ffe6c742ee5d0def9eeb55474e07da5a17909cfd269720088fb100777a9db1e62149a1869a77170aab'
        'SKIP'
        'e18ec7e49d6c28ef6f55db753d4027206f8774dacb782cc6e77a9bdc4ece64533aa7eb002b9ac3effb34dbbc8164f376887fd0ab54d8ff66e022b05c1687360e')

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init extern/taskflow
  git config submodule.extern/taskflow.url "$srcdir/github.com-taskflow-taskflow"
  git -c protocol.file.allow=always submodule update

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
}

build() {
  cd "$pkgname"

  RAPIDFUZZ_BUILD_EXTENSION=1 \
    python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" pytest -v

}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
