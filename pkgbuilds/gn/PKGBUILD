# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=gn
pkgver=0.2385.9ece3f52
_commit=9ece3f5254c273cb46606a6571963f931c3b012d
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
arch=('x86_64')
url="https://gn.googlesource.com/gn/"
license=('BSD-3-Clause')
depends=('libgcc')
makedepends=('clang' 'ninja' 'python' 'git')
source=(git+https://gn.googlesource.com/gn#commit=$_commit)
sha256sums=('37a17310ed6250f3f6a4150f6dfb485c4ffa01e2ecce3ed9afa6c613ca98be8c')

pkgver() {
  cd $pkgname
  echo 0.$(git rev-list --count initial-commit..).$(git rev-parse --short=8 HEAD)
}

build() {
  cd $pkgname
  ./build/gen.py
  ninja -C out
}

check() {
  cd $pkgname
  ./out/gn_unittests
}

package() {
  cd $pkgname
  install -D out/gn "$pkgdir/usr/bin/gn"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r misc/vim/{autoload,ftdetect,ftplugin,syntax} \
    "$pkgdir/usr/share/vim/vimfiles/"
  install -Dm644 -t "$pkgdir/usr/share/emacs/site-lisp" misc/emacs/gn-mode.el
}

# vim:set ts=2 sw=2 et:
