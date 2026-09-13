# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-autobahn
# https://github.com/crossbario/autobahn-python/blob/master/docs/changelog.rst
pkgver=26.7.1
pkgrel=2
pkgdesc='Real-time framework for Web, Mobile & Internet of Things'
arch=(x86_64)
url='https://github.com/crossbario/autobahn-python/'
license=(MIT)
depends=(glibc python python-base58 python-cffi python-twisted python-txaio python-wsaccel
         python-cryptography python-hyperlink python-zope-interface)
makedepends=(git python-build python-installer python-setuptools python-wheel
             python-argon2_cffi python-cbor2 python-flatbuffers
             python-msgpack python-passlib python-pynacl python-pytrie
             python-ubjson
             python-u-msgpack python-ujson python-qrcode python-pyopenssl python-ecdsa
             python-snappy python-click python-txtorcon python-hatchling)
checkdepends=(python-pytest python-pytest-asyncio)
optdepends=(
  'python-cbor2: CBOR serializer support'
  'python-flatbuffers: FlatBuffers serializer support'
  'python-msgpack: MsgPack serializer support'
  'python-u-msgpack: pure-python alternative to python-msgpack for MsgPack serializer support'
  'python-ubjson: UBJSON serializer support'
  'python-ujson: accelerated JSON serializer support'
  'python-argon2_cffi: WAMP-SCRAM authentication support'
  'python-passlib: WAMP-SCRAM authentication support'
  'python-pynacl: WAMP-cryptosign and WAMP-cryptobox support'
  'python-pytrie: WAMP-cryptobox support'
  'python-qrcode: support QR codes in WAMP'
  'python-pyopenssl: SSL/TLS support'
  'python-ecdsa: ECDSA signatures'
  'python-snappy: snappy compression support for WebSocket messages'
  'python-click: for text highlights'
  'python-txtorcon: connections to Tor Onion services'
)

source=("git+https://github.com/crossbario/autobahn-python.git#tag=v$pkgver"
        'remove-march-flags-for-safe-builds.patch'
        'fix-max-message-size-test.patch')
sha256sums=('6b21f854f40496cf2ab328c7ecf8dfa6f3c346e4ca5f9b1fbaf6f460a45ccc22'
            'a27e5bb67aee427a2bd038a9d1bc0d2d2d34a90521fed1a5288a3cec5bfc9f7c'
            '62f54753720289c14055822067d4b08fe37450572e0d3dd723a9e0bf42409405')

prepare() {
  cd "$srcdir/autobahn-python"
  patch -Np1 -i ../remove-march-flags-for-safe-builds.patch
  patch -Np1 -i ../fix-max-message-size-test.patch
  sed -i '/flatc/d' pyproject.toml
}

build() {
  cd "$srcdir/autobahn-python"
  AUTOBAHN_ARCH_TARGET=safe python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/autobahn-python"

  local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  local tmpdir="$srcdir/test_dir/"
  python -m installer --destdir="$tmpdir" dist/*.whl

  export PYTHONPATH="$tmpdir/usr/lib/python${pyver}/site-packages:$PYTHONPATH"

  # "autobahn on asyncio is tested using pytest, while for twisted we are using twisted trial"
  # https://github.com/crossbario/autobahn-python/issues/1235#issuecomment-522440810
  USE_TWISTED=1 trial autobahn
  # pytest configurations are not well organized in upstream repo. Here I ignore everything and pick needed options from
  # https://github.com/crossbario/autobahn-python/blob/v24.4.2/tox.ini#L104
  USE_ASYNCIO=1 pytest src/autobahn --ignore src/autobahn/twisted --import-mode=importlib
}

package() {
  cd "$srcdir/autobahn-python"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
