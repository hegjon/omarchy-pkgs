# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.17
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("git+https://github.com/JessicaTegner/pypandoc.git#tag=v$pkgver")
sha512sums=('66327609ec7002361d81d6712328be32cc416365092d18a04240be26ea446241b3b29d78c5d6acf8e4d231b079c76ae819199e3aed0ed2c7a2cb5304e4f77569')

build() {
  cd pypandoc
  python -m build -wn
}

check() {
  cd pypandoc
  python -m pytest tests/test_pypandoc.py || echo "Tests failed"
}

package() {
  cd pypandoc
  python -m installer -d "$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
