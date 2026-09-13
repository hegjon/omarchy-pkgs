# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-scikit-learn
pkgver=1.9.1
pkgrel=1
pkgdesc='A set of python modules for machine learning and data mining'
arch=(x86_64)
url='https://scikit-learn.org'
_url='https://github.com/scikit-learn/scikit-learn'
license=(BSD-3-Clause)
depends=(python-joblib
         python-narwhals
         python-numpy
         python-scipy
         python-threadpoolctl)
makedepends=(cython
             openmp
             python-{build,installer,wheel}
             meson-python)
optdepends=('python-matplotlib: plotting capabilities')
options=(!emptydirs)
_archive="${pkgname#python-}-$pkgver"
source=("$_url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('bee6fd6ceb15b61057e47154614232f5cac411f21d42305d7d7e395962905a67')

prepare() {
	cd $_archive
	sed -i -E \
		-e '/meson-python/s/,<0.20.0//' \
		-e '/numpy/s/,<2.3.0//' \
		-e '/scipy/s/,<1.16.0//' \
		-e '/cython/s/,<3.2.6//' \
		pyproject.toml
}

build() {
	cd $_archive
	python -m build -wn
}

package() {
	cd $_archive
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
