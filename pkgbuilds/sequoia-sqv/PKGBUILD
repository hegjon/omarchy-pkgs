# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=sequoia-sqv
pkgver=1.5.0
pkgrel=1
pkgdesc='Simple OpenPGP signature verification program'
url='https://sequoia-pgp.org/'
arch=(x86_64)
license=(GPL-2.0-or-later)
groups=(sequoia)
depends=(
  glibc
  gmp
  libgcc
  nettle3
)
makedepends=(
  cargo
  clang
  git
)
source=("git+https://gitlab.com/sequoia-pgp/sequoia-sqv.git#tag=v${pkgver}?signed")
sha512sums=('a6ca500b41c29fa697e872888f71db3c7dde99c559efbac3e0b30af019428d0c7afaf6546e616ffdf2cd3a9f65d5fee02d860af06173d70e2e1de84497800576')
b2sums=('f03157bb71fdf36c035688e025951384cc92c4206ed4c542820287e3f127bf17e89356c610738248f33bd3d3412762bff95ebb3512cf0f46e9e52dde897c5954')
validpgpkeys=(
  D2F2C5D45BE9FDE6A4EE0AAF31855247603831FD # justus@sequoia-pgp.org
  CBCD8F030588653EEDD7E2659B7DD433F254904A # justus@sequoia-pgp.org
  D2F2C5D45BE9FDE6A4EE0AAF31855247603831FD # justus@sequoia-pgp.org
  8F17777118A33DDA9BA48E62AACB3243630052D9 # Neal H. Walfield <neal@sequoia-pgp.org>
)

prepare() {
  cd sequoia-sqv
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd sequoia-sqv
  PKG_CONFIG_PATH=/usr/lib/nettle3/pkgconfig \
  RUSTFLAGS+=" -L/usr/lib/nettle3" \
  cargo build --frozen --release --features 'crypto-nettle'
}

check() {
  cd sequoia-sqv
  PKG_CONFIG_PATH=/usr/lib/nettle3/pkgconfig \
  RUSTFLAGS+=" -L/usr/lib/nettle3" \
  cargo test --frozen --features 'crypto-nettle'
}

package() {
  depends+=(
    libnettle.so
    libhogweed.so
)

  cd sequoia-sqv
  install -Dm 755 target/release/sqv -t "${pkgdir}/usr/bin"

  pushd target/release/build/sequoia-sqv-*/out/shell-completions/
  install -Dm 644 sqv.bash "${pkgdir}/usr/share/bash-completion/completions/sqv"
  install -Dm 644 _sqv -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm 644 sqv.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  popd

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
