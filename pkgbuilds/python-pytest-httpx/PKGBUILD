# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.36.2
pkgrel=1
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-asyncio')
source=("git+https://github.com/Colin-b/pytest_httpx.git#tag=$pkgver")
sha512sums=('710e23a8f93fc9e73f59b6c52f5857b02d5f9f95b5cacb2716869557416e3f7482bfbdb4e8d27b071d6d54b11cf34fbb667b4a4c652febb0f048d04bebc09153')

build() {
  cd pytest_httpx
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
