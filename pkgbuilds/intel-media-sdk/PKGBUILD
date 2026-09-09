# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=intel-media-sdk
pkgname=('intel-media-sdk' 'libmfx')
pkgver=23.2.2
pkgrel=6
pkgdesc='Legacy API for hardware video acceleration on Intel GPUs (Broadwell to Rocket Lake)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
makedepends=(
    'cmake'
    'intel-media-driver'
    'libdrm'
    'libpciaccess'
    'libva'
    'libx11'
    'libxcb'
    'python'
    'wayland')
source=("https://github.com/Intel-Media-SDK/MediaSDK/archive/intel-mediasdk-${pkgver}.tar.gz"
        '010-intel-media-sdk-fix-reproducible-build.patch'::'https://github.com/Intel-Media-SDK/MediaSDK/pull/2688/commits/f6925886f27a39eed2e43c5b7b6c342d00f7a970.patch'
        '020-intel-media-sdk-libcttmetrics-static-only.patch'
        '030-intel-media-sdk-gcc13-fix.patch'
        '040-intel-media-sdk-gcc15-fix.patch')
sha256sums=('12f23a78104edc1c9bfa755effd2723866d107ad752f72d3839fcc8db0503cec'
            'f1d8a4edf953cfec1516f1a8383c5ee033245aba16cfae0bc79b7de1a6365fcc'
            'a473fd7dbd3c7240a3511471cfad6a39dc462b102c88cd23c35e25f2e8ec0246'
            '38fc06cdc31372d26f1dc2a7e5b1ea57c22f8f83fbf84e0af5638a8040aa7f4e'
            '4a7bab16e6d90f1f6e4a365328c0edd08dd8ea02d38687fcb0c2248bb69171d2')

prepare() {
    patch -d "MediaSDK-intel-mediasdk-${pkgver}" -Np1 -i "${srcdir}/010-intel-media-sdk-fix-reproducible-build.patch"
    patch -d "MediaSDK-intel-mediasdk-${pkgver}" -Np1 -i "${srcdir}/020-intel-media-sdk-libcttmetrics-static-only.patch"
    patch -d "MediaSDK-intel-mediasdk-${pkgver}" -Np1 -i "${srcdir}/030-intel-media-sdk-gcc13-fix.patch"
    patch -d "MediaSDK-intel-mediasdk-${pkgver}" -Np1 -i "${srcdir}/040-intel-media-sdk-gcc15-fix.patch"
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S "MediaSDK-intel-mediasdk-${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='OFF' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -DMFX_APPS_DIR='/usr/lib/mfx' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package_intel-media-sdk() {
    depends=(
        'glibc'
        'intel-media-driver'
        'libdrm'
        'libgcc'
        "libmfx=${pkgver}"
        'libstdc++'
        'libva'
        'wayland')
    options=('!emptydirs')
    provides=('vpl-runtime')
    
    DESTDIR="$pkgdir" cmake --install build
    mv "${pkgdir}/usr/lib/libcttmetrics.a" "${pkgdir}/usr/lib/mfx/samples"
    install -D -m644 "MediaSDK-intel-mediasdk-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    [ -d 'libmfx' ] && rm -rf libmfx
    mkdir -p libmfx/usr/{include,lib/pkgconfig}
    mv "${pkgdir}/usr/include/mfx" libmfx/usr/include
    mv "${pkgdir}/usr/lib"/libmfx.so* libmfx/usr/lib
    mv "${pkgdir}/usr/lib/pkgconfig"/{,lib}mfx.pc libmfx/usr/lib/pkgconfig
}

package_libmfx() {
    pkgdesc='Intel Media SDK dispatcher library'
    depends=(
        'glibc'
        'libgcc'
        'libstdc++')
    
    mv -T libmfx "$pkgdir"
    install -D -m644 "MediaSDK-intel-mediasdk-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
