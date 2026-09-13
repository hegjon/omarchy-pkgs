# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-tldextract
pkgver=5.3.2
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=(any)
url='https://github.com/john-kurkowski/tldextract'
license=(BSD-3-Clause)
depends=(
  python
  python-idna
  python-requests
  python-requests-file
  python-filelock
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-responses
  python-sybil
  python-syrupy
)
source=("$pkgname::git+https://github.com/john-kurkowski/tldextract.git#tag=$pkgver")
sha512sums=('5b0600b7ee75f56d4b3909d2b4519ce89d6412a2c5079a06db6647519719ccbd339355d9f7b9ea7dae8983704efb6aa71ceab9897fc6610826a9e808ed5b6a9a')
b2sums=('958a44038355d08caf96e098791f6de28dc473f06390302e8dee506c902c6291f10222c150ba348a1ce9461865b3228d62305d4e1ef00f6af413ec1ad200316c')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set sw=2 et:
