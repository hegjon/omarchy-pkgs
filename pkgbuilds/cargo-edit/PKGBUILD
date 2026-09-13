# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-edit
pkgver=0.13.13
pkgrel=1
pkgdesc='Managing cargo dependencies from the command line'
url='https://github.com/killercup/cargo-edit/releases'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo' 'libssh2' 'openssl')
source=(https://github.com/killercup/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('aa1a679d24c8f12f7c2785e575830502098bf5e999d8cc0ea77c6c9fc137f565b784ca5b2be7583f9bcf854ac954def0697aa16412551f7cc0a87e840fe831cb')
b2sums=('b86f55de2559e99ff03597b298c5737fc0354b25cdeb3aa53488332803a457653a1fcd9bb26a4a7f5522807d1f79bcd9bd298815b9480e57b248fb7d2cbb0467')

_srcenv() {
  cd ${pkgname}-${pkgver}
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
  CFLAGS+=' -ffat-lto-objects'
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
}

prepare() {
  _srcenv
  cargo fetch --locked --target host-tuple
}

build() {
  _srcenv
  cargo build --frozen --release
}

check() {
  _srcenv
  # Note: Rust 1.78 started warning for deprecated config file names, something
  # being used extensively in tests, build with older rust from the package
  # archive if you want to run checks, e.g.:
  # `pkgctl build -I rust-1:1.77.2-2-x86_64.pkg.tar.zst`
  local skipped=(
    # Rust changed some error messages
    'invalid_manifest::case'
    'invalid_workspace_root_manifest::case'
    # Rust 1.85 changed manifest versions
    # as of this pgkver 0.13.0 these tests assume older Rust
    lockfile::case
    upgrade_all::case
    upgrade_workspace::case
    virtual_manifest::case
    workspace_inheritance::case
    workspace_member_cwd::case
  )
  cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 \
    target/release/cargo-upgrade \
    target/release/cargo-set-version \
    -t "${pkgdir}/usr/bin"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
