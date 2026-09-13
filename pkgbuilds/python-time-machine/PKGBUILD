# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.5.0
pkgrel=1
pkgdesc='Travel through time in your tests'
arch=(x86_64)
url='https://github.com/adamchainz/time-machine'
license=(MIT)
depends=(
  glibc
  python
  python-dateutil
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-randomly
  python-tokenize-rt
  python-freezegun
  python-hypothesis
)
optdepends=(
  'python-pytest: for pytest plugin'
  'python-tokenize-rt: for the migration tool'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('a5b7064bcc4bac6f9fe94bc59151cb13b973d8cd559f39978b5ee79166de654997d13cd2ef65ae47b54a8c8470431d8c211e2602cdae09bb3b740e87a446b03c')
b2sums=('87faef71aa427e63916e8a9f3312fbc18892e1d281493d314e2763acd74a49e0d344a8ccfa77710b2e04de36ff20f5b466c8c2ba9ac404b6a105c85d8daea7ba')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
