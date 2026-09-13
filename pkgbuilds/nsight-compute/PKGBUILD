# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-compute
pkgver=2026.3.0.13
pkgrel=1
pkgdesc="Interactive profiler for NVIDIA CUDA and OptiX"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/nsight-compute"
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus
  fontconfig
  glib2
  glibc
  libatomic
  libcap
  libdrm
  libelf
  libgcc
  libglvnd
  libpng
  libstdc++
  libx11
  libxcb
  libxext
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxshmfence
  mesa
  nspr
  nss
  openssl
  python
  sqlite
  wayland
  xcb-util
  xcb-util-cursor
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  zlib
  # there are bundled libs: boost, gcc-libs, icu, libssh, libz, openssl, qt6, zstd
)
optdepends=(
  'cuda: for profiling on the local system'
)
options=(!debug !strip)
source_x86_64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz)
source_aarch64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-sbsa/${pkgname/-/_}-linux-sbsa-$pkgver-archive.tar.xz)
source=(nsight-compute.desktop)
b2sums=('9d31d1e3a8fed40b90cdf5871bd78231e92fae0b13ef66f420677efe7a9b1a6b94b9b83cc9ad1eed29f7eb4db88f3c03383a28da7cc6f811984efa7123ef412b')
b2sums_x86_64=('944bb86fb26821d6e7678097371970aba929bcbf4c1bec858e01b20ab74f4fcfef51920ab60fb8d779fd4fd4a30a8b6e3cf1bb1181b280153eec61b44a7cb574')
b2sums_aarch64=('aecf53dff2224d66b36f00bd31ef23da41aad538d00a6428cb3884df8b19dac12097dbedffe8992224833a235c23c220e8abe78f97c5b792fe54b8cf0589a11d')

prepare()
{
  if [[ $CARCH = aarch64 ]]; then
    sed -i 's/glibc_2_11_3-x64/t210-a64/g' $pkgname.desktop
  fi
}

package() {
  cd ${pkgname/-/_}-linux-*-${pkgver}-archive

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/
  cp -arv extras host ncu ncu-ui sections target "$pkgdir"/usr/lib/$pkgname/

  # create symlinks in /usr/bin/
  install -vdm 755 "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin/ ../lib/$pkgname/{ncu,ncu-ui}

  # install documentation
  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -arv docs/* "$pkgdir"/usr/share/doc/$pkgname/

  # install license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # install desktop entry
  install -vDm 644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop

  # change ncu_report to a proper Python package
  # (compare with https://pypi.org/project/ncu-report/ in a venv)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vdm 755 "$pkgdir$site_packages"/ncu_report/
  mv -v "$pkgdir"/usr/lib/nsight-compute/extras/python/ncu_report.py "$pkgdir$site_packages"/ncu_report/__init__.py
  mv -v "$pkgdir"/usr/lib/nsight-compute/extras/python/_ncu_report.so "$pkgdir$site_packages"/ncu_report/
  if [[ $CARCH = aarch64 ]]; then
    ln -srv "$pkgname"/usr/lib/nsight-compute/target/linux-desktop-t210-a64/libnvperf_host.so "$pkgdir$site_packages"/ncu_report/
  else
    ln -srv "$pkgname"/usr/lib/nsight-compute/target/linux-desktop-glibc_2_11_3-x64/libnvperf_host.so "$pkgdir$site_packages"/ncu_report/
  fi

  # recompile pycache to strip $pkgdir from embedded paths
  python -m compileall "$pkgdir$site_packages"
}
