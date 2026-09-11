# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts-krypton
pkgver=24.20.0
pkgrel=2
pkgdesc='Evented I/O for V8 javascript ("Active LTS" release: Krypton)'
arch=(x86_64)
url=https://nodejs.org/
license=(MIT)
depends=(
  ada
  brotli
  c-ares
  icu
  libnghttp2
  libnghttp3
  libngtcp2
  libuv
#  llhttp
  openssl
  simdjson
#  simdutf
#  v8
  zlib
  zstd
)
makedepends=(
  git
  ninja
  procps-ng
  python
)
optdepends=('npm: nodejs package manager')
provides=(
  "nodejs=$pkgver"
  nodejs-lts
)
conflicts=(nodejs)
source=(
  "git+https://github.com/nodejs/node.git#tag=v$pkgver?signed"
  0001-test-account-for-varied-OpenSSL-CCM-final-behaviours.patch
)
b2sums=('a4e5287d10c437d5ee501ec2c8ce96f0fd6df0d190d361f223edc2e433e4fc23439c6417cb56f361975745089c179edbc48b0c6c83172c3c685328c5a7ad1821'
        '970519acd0adacbe647ecadd7536e2564e11475cb0334e9cedf6f370585a942ac9b13504969205cf59f147ff3e9bf52d7d0e932773420cef38cf30add5e5b38b')
validpgpkeys=(
  8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 # Michaël Zasso (Targos) <targos@protonmail.com>
  890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 # RafaelGSS <rafael.nunu@hotmail.com>
  C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C # Richard Lau <rlau@redhat.com>
  C0D6248439F1D5604AAFFB4021D900FFDB233756 # Antoine du Hamel <duhamelantoine1995@gmail.com>
  5BE8A3F6C8A5C01D106C0AD820B1A390B168D356 # Antoine du Hamel <antoine.duhamel@rosa.be>
  CC68F5A3106FF448322E48ED27F5E38D5B0A215F # marco-ippolito <marcoippolito54@gmail.com>
  108F52B48DB57BB0CC439B2997B01419BD92F80A # Ruy Adorno <ruyadorno@hotmail.com>
  DD792F5973C6DE52C432CBDAC77ABFA00DDBF2B7 # Juan José Arboleda <soyjuanarbol@gmail.com>
)

_set_flags() {
  # /usr/lib/libnode.so uses malloc_usable_size, which is incompatible with fortification level 3
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
}

prepare() {
  cd node
  # test: account for varied OpenSSL CCM final behaviours
  patch --forward --strip=1 --input=../0001-test-account-for-varied-OpenSSL-CCM-final-behaviours.patch
}

build() {
  _set_flags
  cd node

  ./configure \
    --ninja \
    --enable-lto \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-corepack \
    --without-npm \
    --shared-ada \
    --shared-brotli \
    --shared-cares \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-nghttp3 \
    --shared-ngtcp2 \
    --shared-openssl \
    --shared-simdjson \
    --shared-zlib \
    --shared-zstd
    # --shared-http-parser
    # --shared-simdutf
    # --shared-v8

  make
}

check() {
  _set_flags
  cd node
  rm test/parallel/test-http2-client-set-priority.js
  rm test/parallel/test-http2-client-unescaped-path.js
  rm test/parallel/test-http2-max-invalid-frames.js
  rm test/parallel/test-http2-misbehaving-flow-control.js
  rm test/parallel/test-http2-misbehaving-flow-control-paused.js
  rm test/parallel/test-http2-multi-content-length.js
  rm test/parallel/test-http2-priority-event.js
  rm test/parallel/test-http2-reset-flood.js
  rm test/parallel/test-tls-ocsp-callback.js

  make test-only
}

package() {
  _set_flags
  cd node
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
