# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: TheEdgeOfRage on AUR

pkgname=python-awscrt
pkgver=0.32.1
pkgrel=1
pkgdesc='A common runtime for AWS Python projects'
arch=(x86_64)
url='https://github.com/awslabs/aws-crt-python'
license=('Apache-2.0')
depends=(
  aws-c-auth
  aws-c-cal
  aws-c-common
  aws-c-event-stream
  aws-c-http
  aws-c-io
  aws-c-mqtt
  aws-c-s3
  aws-checksums
  glibc
  python
)
makedepends=(
  cmake
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-websockets)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('8675ed02e213d23c785124d89551407447755e5484933a6a8dc8229fc876e03efa825e4e882464c07ec6512e8cc4d54cc846a5621a42d6e7955fe84cb46353c0')

prepare() {
  cd $pkgname
  sed -i "s/^__version__ = .*/__version__ = '$pkgver'/" awscrt/__init__.py
}

build() {
  cd $pkgname
  export AWS_CRT_BUILD_USE_SYSTEM_LIBS=1
  export AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover test
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
