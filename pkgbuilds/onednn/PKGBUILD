# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Baris Demirdelen <barisdemirdelen at gmail dot com>
# Contributor: Andrew Anderson <aanderso@tcd.ie>
# Contributor: Jonathon Fernyhough <jonathon_at manjaro_dotorg>
pkgname=onednn
pkgver=3.11.3
pkgrel=1
pkgdesc="oneAPI Deep Neural Network Library (oneDNN)"
arch=(x86_64)
replaces=('intel-dnnl' 'mkl-dnn')
provides=('intel-dnnl' 'mkl-dnn')
url=https://github.com/oneapi-src/oneDNN
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oneapi-src/oneDNN/archive/v${pkgver}.tar.gz")
sha256sums=('7293a85e146c2710dcf4f7257fdebb91020004cf1627c8de684b814c2498c81a')

build() {
  cd "oneDNN-$pkgver"
  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX="/usr"
  ninja -C build
}

check() {
  cd "oneDNN-$pkgver/build"
  ctest
}

package() {
  cd "oneDNN-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
