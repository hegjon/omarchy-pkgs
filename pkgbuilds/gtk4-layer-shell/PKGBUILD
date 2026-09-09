# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='Library to create panels and other desktop components for Wayland'
pkgname=gtk4-layer-shell
pkgver=1.3.0
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/wmww/gtk4-layer-shell"
depends=(
    "gtk4"
    "wayland"
)
makedepends=(
    "gtk-doc"
    "gobject-introspection"
    "meson"
    "ninja"
    "valabind"
    "python"
    "luajit"
    "wayland-protocols"
)
checkdepends=(
    "lua51-lgi"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ebb01ab14e98afd1727f68f64981c37bd23305b1f131f5667c02b94cf593192')

build() {
    meson setup \
          --prefix=/usr \
          --wrap-mode=nofallback \
          --buildtype=plain \
          -Dtests=true \
          -Ddocs=true \
          -Dintrospection=true \
          -Dvapi=true \
          -Dexamples=true \
          -Dsmoke-tests=false \
          "$pkgname-$pkgver" \
          build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
