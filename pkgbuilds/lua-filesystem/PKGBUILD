# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <arch+pub@p5n.pp.ru>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgbase=lua-filesystem
_rockname=${pkgbase/-/}
pkgname=(lua-filesystem lua51-filesystem lua52-filesystem lua53-filesystem lua54-filesystem)
pkgver=1.9.0
_tag=${pkgver//./_}
pkgrel=3
_rockrel=1
pkgdesc='File System Library for the Lua Programming Language'
arch=(x86_64)
url="https://lunarmodules.github.io/$_rockname"
_url="https://github.com/lunarmodules/$_rockname"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             lua54
             luarocks)
_archive="$_rockname-$_tag"
_rock="$_rockname-$pkgver-$_rockrel.linux-$CARCH.rock"
source=("$_url/archive/v$_tag/$_archive.tar.gz"
        "https://luarocks.org/manifests/hisham/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('1142c1876e999b3e28d1c236bf21ffd9b023018e336ac25120fb5373aade1450'
            '32bbfb40a23a10063a8f332b874556019232e4a01e9bcd9c0cfb422118e2e1c9')

build() {
	cd "$_archive"
	for LUAVER in 5.1 5.2 5.3 5.4 5.5; do
		# https://github.com/lunarmodules/luafilesystem/issues/183
		# Luarocks 3.13.0 + Lua 5.5 has issues copying a file on top of an existing one...
		rm -f lfs.so
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- "../${source[1]##*/}"
		install -Dm0644 -t "lua$LUAVER/" "$_rock"
	done
}

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-filesystem() {
	_package 5.5
}

package_lua54-filesystem() {
	_package 5.4
}

package_lua53-filesystem() {
	_package 5.3
}

package_lua52-filesystem() {
	_package 5.2
}

package_lua51-filesystem() {
	_package 5.1
}
