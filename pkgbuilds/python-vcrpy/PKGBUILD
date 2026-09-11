# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
pkgver=8.3.0
pkgrel=1
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("git+https://github.com/kevin1024/vcrpy.git#tag=v$pkgver")
sha512sums=('e1f4e398d0199baf746649c4f16b7ad0661a0a6442f91ed28cfaf01ffe55e4aa81e5a9c14414f0bb931f1c743fd36386dd191b22a9036003017c2b2cfb072c76')

build() {
  cd vcrpy
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we don't want to download the internet
    --ignore tests/integration
    -m 'not online'
     -W ignore::DeprecationWarning
  )

  cd vcrpy
  PYTHONPATH=".:$PYTHONPATH" pytest "${pytest_options[@]}" tests
}

package() {
  cd vcrpy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
