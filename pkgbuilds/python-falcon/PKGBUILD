# Maintainer: David Runge <dvzrv@archlinux.org>

_name=falcon
pkgname=python-falcon
pkgver=4.3.1
pkgrel=1
pkgdesc="Web API framework for fast and reliable microservices, proxies, and app backends"
arch=(x86_64)
url="https://falconframework.org/"
_url="https://github.com/falconry/falcon"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# TODO: add python-daphne
checkdepends=(
  gunicorn
  hypercorn
  python-aiofiles
  python-cbor2
  python-httpx
  python-jsonschema
  python-mimeparse
  python-msgpack
  python-mujson
  python-orjson
  python-pecan
  python-pytest
  python-pytest-asyncio
  python-pyyaml
  python-rapidjson
  python-requests
  python-testtools
  python-ujson
  python-websockets
  uvicorn
)
optdepends=(
  'python-bottle: for falcon-bench'
  'python-django: for falcon-bench'
  'python-flask: for falcon-bench'
  'python-jsonschema: for JSON schema validation'
  'python-msgpack: for MessagePackHandler'
  'python-pecan: for falcon-bench'
  'python-pprofile: for falcon-bench'
)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('bcde0bcf3166a431756bd2659222df9d6a22be8220b12d5b8b9cdb50163a8c38fdacc6a9b389d3e02d694b0dd3592d5c3bb5ef15ec389f84451444fb8a44427b')
b2sums=('bf9bb3cc64a6e55a89f3cdfaa23427944a92fc0590b1d4404752a4a893f7b1a17090bedc39995237ab8a1ec3d71b3e849d5aa7b400df68528fd2c12b839a7e3e')

prepare() {
  cd $_name-$pkgver
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
