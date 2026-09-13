# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-dkjson
pkgname=("lua-dkjson" "lua54-dkjson" "lua53-dkjson" "lua52-dkjson" "lua51-dkjson")
pkgver=2.11
_rockrel=1
pkgrel=1
pkgdesc='David Kolf’s Pure Lua JSON module with UTF-8 support and no external dependencies'
arch=('any')
url="http://dkolf.de/dkjson-lua/"
license=('MIT')
makedepends=('luarocks'
             'lua51' 'lua52' 'lua53' 'lua54' 'lua' # https://github.com/luarocks/luarocks/issues/1275
            )
_archive="${pkgbase#*-}-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("http://dkolf.de/dkjson-lua/$_archive.tar.gz"
        "https://luarocks.org/manifests/dhkolf/$_rockspec"
        "license-from-upstream")
sha256sums=('7a169af681bc3be738111f38e6a80777a3203a602c1023afeaedaad2f22ee298'
            '5139b907b8f5d39301c7f0b8e50a09ac1d05a38619863664c2f74cd01cd66f3a'
            '695b49734d1244ff236ec8785aa908883deb0f65b2356e36e8739ea06002b03c')

build() {
	cd "$_archive"
	for LUAVER in 5.{1,2,3,4,5}; do
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- "$srcdir/$_rockspec"
		install -Dm0644 -t "lua-$LUAVER/" "$_rock"
	done
}

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua-$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/license-from-upstream"
}

package_lua-dkjson() {
	optdepends=('lua-lpeg: speed up decoding')
	_package 5.5
}

package_lua54-dkjson() {
	optdepends=('lua-lpeg: speed up decoding')
	_package 5.4
}

package_lua53-dkjson() {
	optdepends=('lua53-lpeg: speed up decoding')
	_package 5.3
}

package_lua52-dkjson() {
	optdepends=('lua52-lpeg: speed up decoding')
	_package 5.2
}

package_lua51-dkjson() {
	optdepends=('lua51-lpeg: speed up decoding')
	_package 5.1
}
