# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>

pkgname=python-markdown
pkgver=3.10.3
pkgrel=1
pkgdesc="Python implementation of John Gruber's Markdown"
arch=(any)
url='https://python-markdown.github.io/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-yaml: parse Python in YAML metadata'
  'python-pygments: Code highlighting'
)
checkdepends=(python-yaml python-pygments)
source=("$pkgname::git+https://github.com/Python-Markdown/markdown#tag=$pkgver")
sha512sums=('638e0551e21743a735d114dbb00d4397d14a7f222610e09af7d0b206949218b1f3e594c0345f9978e879372663f1fcdc51584fd2ce842a43b792c0a74720c4ef')
b2sums=('f07cb5b5698e803843bba040d3e616a377ab7d2101872c7faf438976e30b533892bc4211f28a0c149d1233fca580685c134bac8a9aa875c0b2aebddda7d2e901')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
