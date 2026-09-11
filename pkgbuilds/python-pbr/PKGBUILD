# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-pbr
pkgver=7.1.2
pkgrel=1
pkgdesc="Python Build Reasonableness"
arch=('any')
url='https://pypi.python.org/pypi/pbr'
license=('Apache-2.0')
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testresources' 'python-testscenarios'
              'python-testtools' 'python-virtualenv' 'python-sphinx' 'python-testrepository')
source=("git+https://github.com/openstack-dev/pbr.git#tag=$pkgver")
sha512sums=('a6e7fec64c9435cb9638fe7c3f1c5885ed9f5c07f2332b12cfeb9fb57acfdeee25704e3a9f0950fce644e7be25050efb1d736a3d9b6aa037d580328bdb7d934d')

build() {
  cd pbr
  python -m build --wheel --no-isolation
}

check() {
  cd pbr
  # HACK: work around error: could not lock config file /dev/null: Permission denied
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  python -m venv --system-site-packages --without-pip "$srcdir/check-venv"
  "$srcdir/check-venv/bin/python" -m installer dist/*.whl
  # Exclude tests that require networking
  PATH="$srcdir/check-venv/bin:$PATH" "$srcdir/check-venv/bin/python" -m stestr run \
    --exclude-regex 'test_pep_517_support|test_requirement_parsing'
}

package() {
  cd pbr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
