# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname="intel-oneapi-dpcpp-cpp"
pkgver=2026.0.0_947
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI DPC++/C++ Compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('a4307b1ba59fce43483755eb9d1070ebf1a4b86cb21bba084a65f711b1b2b76315141ab03c4b288d1626ccf8a75a87a985b07ccce4bd694836b2eabc12e96b0b')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
)
depends=('intel-oneapi-compiler-dpcpp-cpp-common' 'intel-oneapi-compiler-dpcpp-cpp-runtime'
         'intel-oneapi-compiler-shared-runtime' 'intel-oneapi-compiler-shared'
         'intel-oneapi-tbb' 'intel-oneapi-dev-utilities' 'intel-oneapi-common'
         'gcc-libs' 'glibc' 'bash' 'zlib')
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    # allow libs to be found
    local _lib_path='/opt/intel/oneapi/compiler'
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/linux/lib" > "${_ldso_conf}/${pkgname}.conf"
    echo "${_lib_path}/latest/linux/lib/x64" >> "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
