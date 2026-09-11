# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: emersion <contact emersion fr>

pkgname=libvarlink
pkgver=24.0.1
pkgrel=1
license=('MIT')
pkgdesc='Varlink C library and command line tool'
depends=('libgcc' 'glibc')
makedepends=('meson')
arch=('x86_64')
url='https://github.com/varlink/libvarlink'
source=("https://github.com/varlink/libvarlink/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ca3ecd13005309e0322bc64a26f2960e613f2a9a9cedee845865c2d042f73b3c')
options=('!lto')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build/
  ninja -C build/

  # convert thin archive to fat one
  ar -t build/lib/libvarlink.a | xargs ar rs build/lib/libvarlink.a.new
  mv build/lib/libvarlink.a{.new,}
}

check() {
  cd "$pkgname-$pkgver"
  ninja -vC build/ test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  DESTDIR="$pkgdir/" ninja -C build/ install
}
