# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
pkgver=1.7.1
pkgrel=1
pkgdesc='pytest plugin to set environment variables in pytest.ini or pyproject.toml file'
arch=(any)
url='https://github.com/pytest-dev/pytest-env'
license=(MIT)
depends=(
  python
  python-pytest
  python-dotenv
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(python-pytest-mock)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('2e0c2c8176a8450187beaff13900fe6f38b0d63650cd36ac6ac85843cfeeae675d9b3060e221384ef8c5cc332e8efc7249516d51e1a20217fd0d3d6041261d47')
b2sums=('8ab065144709fb5534521feb4ee03daf9fab3b9785d2bbad4aba1ed2d0ba9268b7ff00877df249f36e0c3bdb695ee29644675cd79e2bf4691795ff22dfdc9029')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v \
    --deselect tests/test_env.py::test_env_via_toml["pyproject toml via tool.pytest"] \
    --deselect tests/test_env.py::test_env_via_toml["pytest toml over pyproject toml"] \
    --deselect tests/test_env.py::test_env_via_toml["subdir pytest toml over parent pyproject toml"] \
    --deselect tests/test_env.py::test_env_via_pyproject_toml_bad["pytest.toml"] \
    --deselect tests/test_env.py::test_env_via_pyproject_toml_bad[".pytest.toml"]

}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
