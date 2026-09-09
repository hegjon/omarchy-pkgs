# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=nopt
pkgname=nodejs-$_npmname
pkgver=10.0.1
pkgrel=1
pkgdesc="Node/npm Option Parsing library"
arch=('any')
url="https://github.com/npm/nopt"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('7ace88407b28bce77ead502d1fef6b9361d869cb6fd8584f6761c3ca194c4f54')
options=("!strip")

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$_npmname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
