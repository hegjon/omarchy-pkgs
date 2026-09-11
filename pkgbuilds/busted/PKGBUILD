# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=busted
pkgname=("$pkgbase" "lua-$pkgbase" "lua54-$pkgbase" "lua53-$pkgbase" "lua52-$pkgbase" "lua51-$pkgbase")
pkgver=2.3.0
_rockrel=1
pkgrel=3
pkgdesc='Elegant Lua unit testing'
arch=(any)
url="https://lunarmodules.github.io/$pkgbase/"
license=(MIT)
_luadeps=(cliargs
          dkjson
          filesystem
          luassert
          mediator
          penlight
          say
          system
          term)
makedepends=(lua
             lua51
             lua52
             lua53
             lua54
             luarocks)
_archive="$pkgbase-$pkgver"
source=("https://github.com/lunarmodules/$pkgbase/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1669a4f59ff9e08ad4b38d4212ad8cdd4519209101e3af5459a596d5ad9a7d24')

_package() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	if [[ $pkgname =~ lua* ]]; then
		rm -rf "$pkgdir/usr/bin"
	else
		rm -rf "$pkgdir/usr/share/lua"
		rm -rf "$pkgdir/usr/lib"
		find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
	fi
}

package_busted() {
	_package 5.5
	pkgdesc+=' (CLI)'
	depends=(lua "lua-$pkgname")
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "completions/zsh/_$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" "completions/bash/$pkgname.bash"
}

package_lua-busted() {
	_package 5.5
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
}

package_lua51-busted() {
	_package 5.1
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
}

package_lua52-busted() {
	_package 5.2
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
}

package_lua53-busted() {
	_package 5.3
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
}

package_lua54-busted() {
	_package 5.4
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
}
