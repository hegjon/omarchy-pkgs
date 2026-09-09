# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

_name=pip
pkgname=python-pip
pkgver=26.2.1
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=(any)
license=(MIT)
depends=(
  python
  python-attrs  # for vendored rich
  python-cryptography  # for vendored requests and urllib3
  python-filelock  # for vendored python-cachecontrol
  python-wheel  # for internal misc utils
)
makedepends=(
  python-build
  python-installer
  python-myst-parser
  python-flit-core
  python-setuptools
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-inline-tabs
  python-sphinx-issues
)
checkdepends=(
  git
  python-freezegun
  python-proxy.py
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
  python-scripttest
  python-tomli-w
  python-virtualenv
  python-werkzeug
  subversion
)
source=(
  https://github.com/pypa/$_name/archive/$pkgver/$_name-$pkgver.tar.gz
  remove-version-constraint.patch
        )
sha512sums=('03a00bdc4387a4e7e4e54672e9198893500d279912ece4cd144f015c568c974ecc2c3c7bd6abf108df852302ddd49468ef0bc514ca4323ee037d754e2fbfaee0'
            'c6d3a3819540c93417ad650d4e4fe87b811b4698bc0d9faf2628c8afbde6bbba65e489c9db4393b01f143724173a81c2e2d754f813b124a2a6d47a1d6c54abf0')
b2sums=('eb7b929de0e99c84c9b1257f1bf737f524eb6de01075d40b36519b082d8a49e107dbd0eded9a8bf737ce8f7d452c5e5cffb853b000d6ac2936b5b84dd607c770'
        'e2ab7e085e0dae925b93711fac7a0460e14ff6b92d079c6b93da9eb0afc6890654fb2a10d4828e96c0695d1a0435cb697702eb274f9b1dd51b37c2a24e4ec543')

prepare() {
  # pip is moving towards a separate sphinx config without towncrier https://github.com/pypa/pip/issues/12881
  # since python-sphinxcontrib-towncrier is broken, we remove its use (as it is not needed for manpages)
  sed '/towncrier/d' -i $_name-$pkgver/docs/html/conf.py

  # remove version constraint on flit-core
  patch -d "$_name-$pkgver" -p1 -i "$srcdir/remove-version-constraint.patch"

  # patch out need for pytest-subket
  sed -i '/--allow-hosts=localhost/d' "$_name-$pkgver/pyproject.toml"
  sed -i '/--allow-unix-socket/d'     "$_name-$pkgver/pyproject.toml"
  sed -i '/--disable-socket/d'        "$_name-$pkgver/pyproject.toml"
}

build() {
  cd $_name-$pkgver

  python -m build --wheel --no-isolation

  cd docs/
  PYTHONPATH="$srcdir/$_name-$pkgver/src/" python pip_sphinxext.py
  PYTHONPATH="$srcdir/$_name-$pkgver/src/" sphinx-build -b man -d build/doctrees/man man build/man -c html
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _deselected=(
    # deselect tests that would require python-pip in checkdepends (may or may not work due to devendored dependencies when python-pip is updated)
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_with_source_dir_obtains_commit_id
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_without_source_dir
    --deselect tests/unit/test_wheel_builder.py::test_should_cache_git_sha
    # disable downloading the internet
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_web_archive
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_vcs
    --deselect tests/unit/test_network_session.py::TestPipSession::test_proxy
    # fails due to EXTERNALLY-MANAGED / PEP 668 behaviour in v25
    --deselect tests/unit/test_self_check_outdated.py::test_pip_self_version_check_calls_underlying_implementation
  )

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -m unit "${_deselected[@]}" tests/
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 docs/build/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"

  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --bash | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --zsh | tail -n+3 | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --fish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip.fish
}
