# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=6.0.2
pkgrel=2
pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://github.com/corydolphin/flask-cors'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-flask'
  'python-werkzeug'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('c4b49e61505438132abf9c347c3dfee12a85d94a60f307f731f32ebf240c0ab1')

prepare() {
	cd ${pkgname#python-}
	# Write versions following upstream release workflow
	# https://github.com/corydolphin/flask-cors/blob/5.0.1/.github/workflows/on-release-main.yml#L20-L21
	local RELEASE_VERSION=$pkgver
	sed -i "s/^version = \".*\"/version = \"$RELEASE_VERSION\"/" pyproject.toml
	sed -i "s/__version__ .*/__version__ = \"$RELEASE_VERSION\"/" flask_cors/version.py
}

build() {
	cd ${pkgname#python-}
	python -m build --wheel --no-isolation
}

check() {
	cd ${pkgname#python-}
	# Upstream uses nosetests, which appears to test all Pyton files,
	# while unittest discovers test*.py only by default.
	python -m unittest discover -p '*test*.py'
}

package() {
	cd ${pkgname#python-}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
