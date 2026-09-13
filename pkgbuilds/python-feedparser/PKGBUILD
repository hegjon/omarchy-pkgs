# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-feedparser
pkgver=6.0.14
pkgrel=1
pkgdesc='Parse RSS and Atom feeds in Python'
arch=(any)
url=https://github.com/kurtmckee/feedparser
license=(BSD-2-Clause)
depends=(
  libxml2
  python
  python-requests
  python-feedparser-sgmllib
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-chardet python-pytest)
optdepends=(
  'python-chardet: for character encoding auto-detection'
  'python-cchardet: for faster character encoding auto-detection'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('fe763e2ce85d4c3032ee7c381785f507dbe2be8ecdaebe4e91f8e6815c9cc32ecb5d80497f817f4d3324265fcaf4e89d3124783df1d7213f38764dab6a5dd533')
b2sums=('8aca4e7026d3db97aadaeff6f968e6151beb02c35158ff306fe4ffd6be996892de5f98c1ed1ee178893ced9ba5b95b9828df142da8bbc145808373cbf21728f8')

build() {
  cd "$pkgname"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname"

  local files=(
    tests/illformed/chardet/euckr.xml
    tests/illformed/chardet/gb2312.xml
    tests/illformed/chardet/tis620.xml
    tests/illformed/chardet/windows1255.xml
    # https://github.com/kurtmckee/feedparser/issues/236
    tests/illformed/undeclared_namespace.xml
  )

  for file in "${files[@]}"; do
    mv "${file}" "${file}.bak"
  done


  PYTHONPATH="$PWD/build/lib" python tests/runtests.py

  for file in "${files[@]}"; do
    mv "${file}.bak" "${file}"
  done
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
