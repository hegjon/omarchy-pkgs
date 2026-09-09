# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

pkgname=onetbb
pkgver=2023.1.0
pkgrel=1
pkgdesc='oneAPI Threading Building Blocks - a high level abstract threading library'
arch=('x86_64')
url='https://uxlfoundation.github.io/oneTBB/'
license=('Apache-2.0')
depends=(
    'glibc'
    'hwloc'
    'libgcc'
    'libstdc++')
optdepends=(
    'python: for Python module')
makedepends=(
    'cmake'
    'python'
    'python-pip'
    'python-setuptools'
    'swig')
conflicts=('intel-tbb' 'tbb')
provides=("intel-tbb=${pkgver}" "tbb=${pkgver}")
replaces=('intel-tbb' 'tbb')
source=("https://github.com/uxlfoundation/oneTBB/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onetbb-fix-linkage-of-test-malloc-pure-c.patch')
sha512sums=('c8e9b9100873d6f8514da18ca700165466a9c042d24a6ce9e8901c8996c348f2e58f0251b1eca47d33cc5f382783bfc7693bc6c451716540d4caa57339b3b535'
            'ea5480e7995f4c20ac66ca589ce1f98edb85e70eb1af498df04df09461c9a6175bcd2bf0dea7038f992528d8fd3e47932e16dedee0831436cb046c9fb23b4fb3')

prepare() {
    # https://github.com/uxlfoundation/oneTBB/issues/1735
    # https://gitlab.archlinux.org/archlinux/packaging/packages/onetbb/-/merge_requests/2
    patch -d "oneTBB-${pkgver}" -Np1 -i "${srcdir}/010-onetbb-fix-linkage-of-test-malloc-pure-c.patch"
}

build() {
    cmake -B build -S "oneTBB-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTBB_STRICT:BOOL='OFF' \
        -DTBB4PY_BUILD:BOOL='ON' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure -E test_partitioner # hangs on build server
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
