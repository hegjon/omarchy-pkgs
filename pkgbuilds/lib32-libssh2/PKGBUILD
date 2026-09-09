# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Felixonmars <felixonmars@archlinux.org>
# Contributor: Florian Pritz <flo@xssn.at>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=lib32-libssh2
_name=${pkgname#lib32-}
pkgver=1.11.1
pkgrel=5
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (32-bit)"
url="https://www.libssh2.org/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('lib32-glibc' 'lib32-openssl' 'lib32-zlib' $_name)
makedepends=(git)
provides=('libssh2.so')
source=(
  "git+https://github.com/libssh2/libssh2.git?signed#tag=$_name-$pkgver"
  $_name-1.11.1-CVE-2025-15661.patch
  $_name-1.11.1-CVE-2026-55200.patch
  $_name-1.11.1-CVE-2026-58050.patch
  $_name-1.11.1-CVE-2026-66032.patch
  $_name-1.11.1-CVE-2026-66034.patch
  $_name-1.11.1-CVE-2026-66035.patch
)
sha512sums=('6a54a0b5bd6acb39dcc71f6a3326d557651bd1305511ebc00be9141c92253a160ea2efccca5c4ce97e666c2a29affa5b865f33b7f93a4bc551a25a49df66f871'
            '6ef6232b598d43aa132255593b51026061535fe054864ec6b3f230ec445a156ffea73eca7b7a1f3321b8d642fc8420bc7a3dd2e0de441a71a0115076eba81324'
            'dca03419d0cd8fb103c01ad34165a0d5aded46e3177f7b219ddcddeaa62194dc3e015fc9e9d48e8f08c3ddc93a405a0e1d39c9f9e1892c1fad51fee8be144778'
            '37e075f451ad6b725faa67e4b91228ae8f3289c8c3d51a3cc1ece07451bf585f45f51df30267779074e5dbef7843e2ae5f0169c05baf51b0465927781b3db219'
            '6349dae11fe069abfe1879932ce65b8c0f119e7617635941fc2ed121ad2053c14b1b9f0f914eceffe64ca12d7e2b403311d7efaeb747fb5ef31536e38f0d549c'
            '067f115aa80d0760ded47da46e0c1abebd039d0113e79081618d8491fc61fdd984a081b50b3ee551ad469e6848fcba2171a7a07bf78bbc4a6a6fd0100b00a34f'
            'c8faac60822b1c5183d65f92f25b97e5a187b1ca715d62b3aeeb60c15d1bb9478402975a0cb86c22842b27b447ed15f765212ec871b41e4053a10bb58ac0e350')
b2sums=('e09704f04dea54a1583e295002f27de7a40a97fcb05ab12b650735af78be177ddf211ebb2c78098b1b39800ea40b95a63364b50773f54150dff171d0af03177b'
        'bb012adcced6e85c4e5e987082ccdae893fa10f17862ac49037b1f0232e16ebde3317235bc2ee7d6054678d2c927077c3ab0ce6d35990671d2c3314d4d9ae66f'
        '743feb7c180288de94649bb1a20b1b2761151c6eaa271d4b6bf145bfceb30684803dfe3c1f6314714381fdce784c5a426c5adc3d58ee49ab1fc0d8f1bc66abfd'
        'd552a28093841db332a23d2aad5f1f305ef3659e3d9de9cf5b2888a1f6d86a4418830aaa51e91e0c72086eb056806cbb0cfe9244ddb88c0b68b11612aa77d9de'
        '3b5ba94a2f6a40610b9a3d0ca51b29107f0d265e278f4c12cd65da6d737b7e887c7a917145ae635443cf81d4f912b2ba40f8041cd18e6b16350a1ea03eaade9b'
        'e791bf16d3b52a5eb9ffbd2f7f15c3c376fdf8ef2cf4d3f6c2bd06550dcfb42135eb4662c2d47341409200e3651cca44936df83b8462c4cd2765e4ddfcc6e59d'
        '8f5fdf8e4b32a5252a648c99dc79cd15c8af2b6bea0eca29888056754d5b257a01a3b1928b0b34e460f4de19f3295182cf906acf73a88908867bcd2ffa91e9d9')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2')   # Daniel Stenberg

prepare() {
  cd ${_name}
  patch -Np1 -i ../$_name-1.11.1-CVE-2025-15661.patch  # CVE-2025-15661
  git cherry-pick -n 256d04b60d80bf1190e96b0ad1e91b2174d744b1  # CVE-2026-7598
  git cherry-pick -n 17626857d20b3c9a1addfa45979dadcee1cd84a4  # CVE-2026-55199
  patch -Np1 -i ../$_name-1.11.1-CVE-2026-55200.patch  # CVE-2026-55200
  git cherry-pick -n a9758da45a52bc8c630ec9493804d0c6ea30b24a  # CVE-2026-58051
  patch -Np1 -i ../$_name-1.11.1-CVE-2026-58050.patch  # CVE-2026-58050
  patch -Np1 -i ../$_name-1.11.1-CVE-2026-66032.patch  # CVE-2026-66032
  # CVE-2026-66033: https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6
  git cherry-pick -n a2ed82d40964bbc0d64cd717aa0a5a892117d2e6
  patch -Np1 -i ../$_name-1.11.1-CVE-2026-66034.patch  # CVE-2026-66034
  patch -Np1 -i ../$_name-1.11.1-CVE-2026-66035.patch  # CVE-2026-66035
  # The "_DEV" suffix is only removed from `LIBSSH2_VERSION` for dist tarballs, so we do it here.
  sed 's/_DEV//' --in-place include/libssh2.h
  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_name}
  ./configure --prefix=/usr --libdir=/usr/lib32
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_name}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
