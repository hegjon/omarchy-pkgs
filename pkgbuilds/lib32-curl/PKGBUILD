# Maintainer: Daniel Wallace <danielwallace@aur.archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=lib32-curl
pkgname=(lib32-curl lib32-libcurl-compat lib32-libcurl-gnutls)
pkgver=8.22.0
pkgrel=1
pkgdesc='command line tool and library for transferring data with URLs (32-bit)'
arch=('x86_64')
url='https://curl.se/'
license=('curl')
makedepends=(
  # for building
  'git'
  'patchelf'
  'curl'
  # actual package dependencies
  'lib32-brotli'
  'lib32-gnutls'
  'lib32-krb5'
  'lib32-nettle'
  'lib32-libidn2'
  'lib32-libnghttp2'
  'lib32-libnghttp3'
  'lib32-libngtcp2'
  'lib32-libpsl'
  'lib32-libssh2'
  'lib32-openssl'
  'lib32-zlib'
  'lib32-zstd')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
source=("git+https://github.com/curl/curl.git?signed#tag=curl-${pkgver//./_}")
sha512sums=('398cd510438960167f65fc7733b8a371808f17ba89809ed8dcce67cc5bcaa91a736d316a28ab95bef72ec5ec3e32705498a066bb6ac5e1d74d37ffeb68f4fe81')

_backports=(
)

_reverts=(
)

prepare() {
  cd curl

  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done

  # no '-DEV' in version, release date from tagged commit...
  sed -i \
    -e "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${pkgver}\"" \
    -e "/\WLIBCURL_TIMESTAMP\W/c #define LIBCURL_TIMESTAMP \"$(git log -1 --format=%cs "curl-${pkgver//./_}")\"" \
    include/curl/curlver.h

  autoreconf -fi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local _configure_options=(
    --prefix='/usr'
    --disable-dependency-tracking
    --disable-ldap
    --disable-ldaps
    --enable-ipv6
    --enable-threaded-resolver
    --enable-manual
    --enable-websockets
    --with-gssapi
    --with-libssh2
    --with-nghttp3
    --with-ngtcp2
    --with-random='/dev/urandom'
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'
    --libdir='/usr/lib32'
  )

  mkdir build-curl{,-compat,-gnutls}

  # build lib32-curl
  cd "${srcdir}"/build-curl

  "${srcdir}/curl"/configure \
    "${_configure_options[@]}" \
    --enable-versioned-symbols \
    --without-gnutls \
    --with-openssl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
  make libcurl.pc

  # build lib32-libcurl-compat
  cd "${srcdir}"/build-curl-compat

  "${srcdir}/curl"/configure \
    "${_configure_options[@]}" \
    --disable-versioned-symbols \
    --without-gnutls \
    --with-openssl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
  patchelf --set-soname 'libcurl-compat.so.4' ./lib/.libs/libcurl.so

  # build lib32-libcurl-gnutls
  cd "${srcdir}"/build-curl-gnutls

  "${srcdir}/curl"/configure \
    "${_configure_options[@]}" \
    --disable-versioned-symbols \
    --with-gnutls \
    --without-openssl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C lib
  patchelf --set-soname 'libcurl-gnutls.so.4' ./lib/.libs/libcurl.so
}

package_lib32-curl() {
  depends=(
    'curl'
    'lib32-brotli' 'libbrotlidec.so'
    'lib32-krb5' 'libgssapi_krb5.so'
    'lib32-libidn2' 'libidn2.so'
    'lib32-libnghttp2' 'libnghttp2.so'
    'lib32-libnghttp3' 'libnghttp3.so'
    'lib32-libngtcp2' 'libngtcp2.so'
    'lib32-libpsl' 'libpsl.so'
    'lib32-libssh2' 'libssh2.so'
    'lib32-openssl' 'libcrypto.so' 'libssl.so'
    'lib32-zlib' 'libz.so'
    'lib32-zstd' 'libzstd.so')
  provides=('libcurl.so')

  cd "${srcdir}"/build-curl

  make -C lib DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-pkgconfigDATA

  # license
  install -d "${pkgdir}/usr/share/licenses"
  ln -s curl "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-libcurl-compat() {
  pkgdesc='command line tool and library for transferring data with URLs (32-bit, no versioned symbols)'
  depends=(
    'libcurl-compat'
    'lib32-brotli' 'libbrotlidec.so'
    'lib32-krb5' 'libgssapi_krb5.so'
    'lib32-libidn2' 'libidn2.so'
    'lib32-libnghttp2' 'libnghttp2.so'
    'lib32-libnghttp3' 'libnghttp3.so'
    'lib32-libngtcp2' 'libngtcp2.so'
    'lib32-libpsl' 'libpsl.so'
    'lib32-libssh2' 'libssh2.so'
    'lib32-openssl' 'libcrypto.so' 'libssl.so'
    'lib32-zlib' 'libz.so'
    'lib32-zstd' 'libzstd.so')
  provides=('libcurl-compat.so')

  cd "${srcdir}"/build-curl-compat

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib32/libcurl{,-compat}.so.4.8.0
  rm "${pkgdir}"/usr/lib32/libcurl.{a,so}*
  for version in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-compat.so.4.8.0 "${pkgdir}"/usr/lib32/libcurl.so.${version}
    ln -s libcurl-compat.so.4.8.0 "${pkgdir}"/usr/lib32/libcurl-compat.so.${version}
  done

  # license
  install -d "${pkgdir}/usr/share/licenses"
  ln -s curl "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-libcurl-gnutls() {
  pkgdesc='command line tool and library for transferring data with URLs (32-bit, no versioned symbols, linked against gnutls)'
  depends=(
    'libcurl-gnutls'
    'lib32-brotli' 'libbrotlidec.so'
    'lib32-gnutls' # 'libgnutls.so'
    'lib32-krb5' 'libgssapi_krb5.so'
    'lib32-libidn2' 'libidn2.so'
    'lib32-libnghttp2' 'libnghttp2.so'
    'lib32-libnghttp3' 'libnghttp3.so'
    'lib32-libngtcp2' 'libngtcp2.so' 'libngtcp2_crypto_gnutls.so'
    'lib32-libpsl' 'libpsl.so'
    'lib32-libssh2' 'libssh2.so'
    'lib32-nettle' 'libnettle.so'
    'lib32-zlib' 'libz.so'
    'lib32-zstd' 'libzstd.so')
  provides=('libcurl-gnutls.so')

  cd "${srcdir}"/build-curl-gnutls

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib32/libcurl{,-gnutls}.so.4.8.0
  rm "${pkgdir}"/usr/lib32/libcurl.{a,so}*
  ln -s libcurl-gnutls.so.4 "${pkgdir}"/usr/lib32/libcurl-gnutls.so
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-gnutls.so.4.8.0 "${pkgdir}"/usr/lib32/libcurl-gnutls.so.${version}
  done

  # license
  install -d "${pkgdir}/usr/share/licenses"
  ln -s curl "${pkgdir}/usr/share/licenses/${pkgname}"
}
