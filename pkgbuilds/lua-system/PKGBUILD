# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-system
_rockname=${pkgbase#lua-}
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname" "lua54-$_rockname")
pkgver=0.7.1
_rockrel=1
pkgrel=1
pkgdesc='Platform independent system calls for Lua'
arch=(x86_64 i686)
url="https://github.com/lunarmodules/${pkgbase/-/}"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             lua54
             luarocks)
checkdepends=(busted)
_archive="${pkgbase/-/}-$pkgver"
_rock="$_archive-$_rockrel.linux-$CARCH.rock"
_rockspec="rockspecs/$_archive-$_rockrel.rockspec"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('c85fb1e05ba5059a767ee0f6c8db8b9a30b86760224085b687ffbdf4892895cd')

build() {
	cd "$_archive"
	for LUAVER in 5.{1,2,3,4,5}; do
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- "$_rockspec"
		install -Dm0644 -t "lua-$LUAVER/" "$_rock"
	done
}

check() {
	cd "$_archive"
	# Properly testing this is eluding us because busted itself depends on
	# it, and isolating the version *used by* busted from the version being
	# *tested by* busted isn't trivial.
	# luarocks make --local
	# eval $(luarocks path --local)
	# busted --exclude-tags=manual
}

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua-$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}

package_lua-system() {
	_package 5.5
}

package_lua54-system() {
	_package 5.4
}

package_lua53-system() {
	_package 5.3
}

package_lua52-system() {
	_package 5.2
}

package_lua51-system() {
	_package 5.1
}
