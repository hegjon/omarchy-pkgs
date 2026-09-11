# Maintainer: Jürgen Hötzel <juergen@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=dune
pkgver=3.24.2
pkgrel=1
pkgdesc="A composable build system for OCaml (formerly jbuilder)"
arch=(x86_64)
url="https://github.com/ocaml/dune"
license=('MIT')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-pp' 'ocaml-re')
makedepends=('git' 'ocaml-compiler-libs' 'ocaml-findlib')
optdepends=()
provides=('dune-configurator')
source=("https://github.com/ocaml/dune/releases/download/${pkgver}/dune-${pkgver}.tbz")
sha256sums=('472798691b0216daf538709f0f4703b3617ef24ad0866c9096068baaba4d762a')

# Packages to install from the dune release
_dune_release_pkgs=(
    'dune'
    'dune-action-plugin'
    'dune-build-info'
    'dune-configurator'
    'dune-glob'
    'dune-private-libs'
    'dune-rpc'
    'dune-site'
    'chrome-trace'
    'dyn'
    'fs-io'
    'ordering'
    'stdune'
    'xdg'
    'top-closure'
    'ocamlc-loc'
)

build() {
    cd "${srcdir}/dune-${pkgver}"
    local IFS=,

    ./configure --prefix=/usr --libdir=/usr/lib/ocaml
    make ./_boot/dune.exe
    ./_boot/dune.exe build "${_dune_release_pkgs[@]/%/.install}" -p "${_dune_release_pkgs[*]}" --profile dune-bootstrap
}

# Tests require a bunch of (currently) unpackaged dependencies
#check() {
#    cd "${srcdir}/dune-${pkgver}"
#    make test
#}

package() {
    cd "${srcdir}/dune-${pkgver}"
    local IFS=,

    # Install main dune
    make install DESTDIR="${pkgdir}"

    # Install additional packages
    ./dune.exe install -p "${_dune_release_pkgs[*]}" --destdir="${pkgdir}" --prefix=/usr --libdir=/usr/lib/ocaml

    # Fix doc and man install
    install -d "${pkgdir}"/usr/share
    mv -v  "${pkgdir}"/usr/{doc,share/}
    mv -v "${pkgdir}"/usr/{man,share/}

    # Install license
    install -Dm644 "${srcdir}/dune-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
