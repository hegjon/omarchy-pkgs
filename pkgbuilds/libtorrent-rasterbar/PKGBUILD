# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libtorrent-rasterbar
pkgver=2.1.1
pkgrel=2
epoch=1
pkgdesc='An efficient and feature complete C++ BitTorrent library implementation'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
license=('BSD-3-Clause')
depends=(
    'boost-libs'
    'glibc'
    'libgcc'
    'libstdc++'
    'openssl')
makedepends=(
    'boost'
    'cmake'
    'git'
    'python'
    'python-setuptools')
source=('libtorrent-rasterbar'::"git+https://github.com/arvidn/libtorrent.git#tag=v${pkgver}"
        'git+https://github.com/arvidn/libsimulator.git'
        'git+https://github.com/arvidn/try_signal.git'
        'git+https://github.com/paullouisageneau/boost-asio-gnutls.git'
        'git+https://github.com/paullouisageneau/libdatachannel.git'
        # libdatachannel git submodules
        'git+https://github.com/SergiusTheBest/plog.git'
        'git+https://github.com/paullouisageneau/usrsctp.git'
        'git+https://github.com/paullouisageneau/libjuice.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/cisco/libsrtp.git'
        '010-libtorrent-rasterbar-fix-for-fortify-source-3.patch')
sha512sums=('617501711b24394e5f0faea9365218159b6d3c212ecb6aef9989157847400743438f4bc044ad496f8d24eb1cf721b74f1dff54ebd66137ce264df2ec744ec7eb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c0ddab473428658b816f5b832dd6a431d64e5698f85d97c6090bee1b247bddef37850d53e19f1019cc37f25fad33da1294df9ecbbf616be7570d94545c771f7e')

prepare() {
    git -C libtorrent-rasterbar submodule init
    git -C libtorrent-rasterbar config --local submodule.simulation/libsimulator.url "${srcdir}/libsimulator"
    git -C libtorrent-rasterbar config --local submodule.deps/try_signal.url "${srcdir}/try_signal"
    git -C libtorrent-rasterbar config --local submodule.deps/asio-gnutls.url "${srcdir}/boost-asio-gnutls"
    git -C libtorrent-rasterbar config --local submodule.deps/libdatachannel.url "${srcdir}/libdatachannel"
    git -C libtorrent-rasterbar -c protocol.file.allow='always' submodule update
    
    # libdatachannel git submodules
    git -C libtorrent-rasterbar/deps/libdatachannel submodule init
    git -C libtorrent-rasterbar/deps/libdatachannel config --local submodule.deps/plog.url "${srcdir}/plog"
    git -C libtorrent-rasterbar/deps/libdatachannel config --local submodule.deps/usrsctp.url "${srcdir}/usrsctp"
    git -C libtorrent-rasterbar/deps/libdatachannel config --local submodule.deps/libjuice.url "${srcdir}/libjuice"
    git -C libtorrent-rasterbar/deps/libdatachannel config --local submodule.deps/json.url "${srcdir}/json"
    git -C libtorrent-rasterbar/deps/libdatachannel config --local submodule.deps/libsrtp.url "${srcdir}/libsrtp"
    git -C libtorrent-rasterbar/deps/libdatachannel -c protocol.file.allow='always' submodule update
    
    # https://github.com/arvidn/libtorrent/issues/7519
    # remove usage of malloc_usable_size() for _FORTIFY_SOURCE=3 compatibility
    patch -d libtorrent-rasterbar -Np1 -i "${srcdir}/010-libtorrent-rasterbar-fix-for-fortify-source-3.patch"
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libtorrent-rasterbar \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Dboost-python-module-name:STRING='python' \
        -Dpython-bindings:BOOL='ON' \
        -Dpython-egg-info:BOOL='ON' \
        -Dpython-install-system-dir:BOOL='ON' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
