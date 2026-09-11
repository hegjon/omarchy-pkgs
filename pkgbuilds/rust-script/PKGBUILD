# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Wenxuan Zhang <wenxuangm@gmail.com>

pkgname=rust-script
pkgver=0.36.0
pkgrel=2
pkgdesc='Run Rust files and expressions as scripts without any setup or compilation'
arch=(x86_64)
url='https://rust-script.org'
license=(MIT Apache-2.0)
depends=(glibc libgcc)
makedepends=(git rust)
source=("$pkgname::git+https://github.com/fornwall/rust-script#tag=$pkgver")
sha512sums=('f7b775c39b7416085a3466e7afbef01692e8db357256588f353cbe2828d67de52a3993117fc26b8e7b054525e1b610c30ff20a4415fdf275e64b18eeca406380')
b2sums=('1bfad11c0e989d44e266ece373f9ae61b69b270be480a1303d2112d993c8828d2aee296304735a23db2db5e858d8ad112f446bb5f689ae3323deea7a365ca403')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release
}

check() {
  cd "$pkgname"

  cargo test \
	--frozen -- \
	--skip "tests::script::test_nightly_toolchain" \
	--skip "tests::script::test_stable_toolchain"
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
