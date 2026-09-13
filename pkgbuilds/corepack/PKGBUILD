# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=corepack
pkgver=0.36.0
pkgrel=1
pkgdesc='Zero-runtime-dependency Node.js script'
arch=(any)
url=https://github.com/nodejs/corepack
license=(MIT)
depends=(nodejs)
makedepends=(
  corepack
  git
  python
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('7d5b5d118ea35eb09bc73453676d113d74c572854b7e9a9218980f1d6ec72c6447abd05d0bc81d7900724336a805a4b1bea27c6893949266eb62710e178f0920')

prepare() {
  cd $pkgname
  mkdir bin
  corepack enable --install-directory bin yarn
  yes | bin/yarn set version stable
  yes | bin/yarn install --immutable
}

build() {
  cd $pkgname
  bin/yarn build
}

check() {
  cd $pkgname
  # Attempts to create symlinks in /usr/bin
  bin/yarn test run --exclude tests/Enable.test.ts
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/bin,usr/share/licenses/$pkgname,$mod_dir}
  ln -s $mod_dir/dist/$pkgname.js "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md

  cd $pkgname
  cp -a {CHANGELOG,LICENSE,README}.md dist package.json "$pkgdir"/$mod_dir
}
