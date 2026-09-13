# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgbase=edk2
pkgname=(edk2-aarch64 edk2-riscv64 edk2-shell edk2-ovmf)
pkgver=202608
pkgrel=1
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(
  Apache-2.0
  BSD-2-Clause-Patent
  MIT
)
makedepends=(
  aarch64-linux-gnu-gcc
  acpica
  git
  util-linux-libs
  nasm
  python
  riscv64-linux-gnu-gcc
)
options=(!makeflags)
source=(
  git+$url#tag=$pkgbase-stable$pkgver
  openssl::git+https://github.com/openssl/openssl.git  # also submodule for libspdm
  pyca-cryptography::git+https://github.com/pyca/cryptography.git  # submodule for openssl
  krb5::git+https://github.com/krb5/krb5.git  # submodule for openssl
  gost-engine::git+https://github.com/gost-engine/engine.git  # submodule for openssl
  libprov::git+https://github.com/provider-corner/libprov.git  # submodule for gost-engine
  wycheproof::git+https://github.com/google/wycheproof.git  # submodule for openssl
  berkeley-softfloat-3::git+https://github.com/ucb-bar/berkeley-softfloat-3.git
  $pkgbase-cmocka::git+https://github.com/tianocore/edk2-cmocka.git
  oniguruma::git+https://github.com/kkos/oniguruma.git
  brotli::git+https://github.com/google/brotli.git
  jansson::git+https://github.com/akheron/jansson.git
  googletest::git+https://github.com/google/googletest.git  # also a submodule for public-mipi-sys-t
  edk2-subhook::git+https://github.com/tianocore/edk2-subhook.git
  pylibfdt::git+https://github.com/devicetree-org/pylibfdt.git
  public-mipi-sys-t::git+https://github.com/MIPI-Alliance/public-mipi-sys-t.git
  pugixml::git+https://github.com/zeux/pugixml.git  # submodule for public-mipi-sys-t
  mbedtls::git+https://github.com/Mbed-TLS/mbedtls.git  # also submodule for libspdm
  libspdm::git+https://github.com/DMTF/libspdm.git
  cmocka::git+https://gitlab.com/cmocka/cmocka.git  # submodule for libspdm
  50-edk2-ovmf-x86_64-secure-4m.json
  60-edk2-ovmf-x86_64-4m.json
  60-edk2-ovmf-microvm-4m.json
  60-edk2-aarch64.json
  60-edk2-riscv64.json
  80-edk2-ovmf-ia32-on-x86_64-secure-4m.json
  81-edk2-ovmf-ia32-on-x86_64-4m.json
)
sha512sums=('6143e7da19cb1c2b81e462afbcd118d35d415126a0daefa71fbbc3b56d1ef5f44b1cfc454e28f83be6f19e52228ba63337d1555b4f475b1a516bfff3fec326fb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c1f83b3c5f5c43803d4bb1084f6ebdd1987364cab59945a8226a8cf1229daba79c83f638c0a1395ea56acffbd4349b94459659705743a397ff03369b7794a1c6'
            '9da9de6717b610a181be8f7b34b379a56a1fa31f945f78198eec52359abd178bdf77fda4426157992e64329f53a204af042d5145cb5d3b4b1203915a48815449'
            'b17d3ff5c9230c394ca4ee8229842c801b0cab3d88b546f2094dd0b42f2bc535f5bda3f9faee4b5418482185887648f906daaf0b7307c4c19747f5f0ab504f9a'
            '01cc57d746c4ac77c2a88eae0adeb7d4095f1fb23488554959d4adef8c547820989eb6a52a2f2c635567e052350c5784588adbb11e0c1283a51f0e9ccce94247'
            'b40c2f5f0aff50d7e8d95c956d5e25fb5b0817e00d3da3f0e1230c2acdf6074c670be382d36d74836cf00f95866e8b162fde355d549c6c9001d41139c7d09706'
            '95661c2182112a76652507de84b7d0f9bb0d21f6b3b62134952bd7aada8df5cfc727658d11b71a7780a22049d9cafc4361d9a1d515b68d1463e7082465fd4f7e'
            'c9dbe7b2b6b8c18b7b8fdfef5bc329d9142c442f2f3dbae3ca4919255dcaf2ab576cd305648228d5dd48040ca3b14f44ee33b05cb6ca13b49e2836947b78ea53')
b2sums=('29f444c69831debfc48583a5c6c60a3dcfdc44987ca127232a10091f4547289de33feea20aa1dc6333f02d9d3fb149719e65ce5bf389d6e4a912ac61fb1d8be0'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'b9a488c2a6295f3d8eab80150dbfa7acea94720b08928d4e6a4613189fe24922f6c40e1ae8c9856ebb1bc31586ecfb1e02e099a11f7abde575d1f9aa78cc732d'
        '56562116024236f6bb5590fff241d47568a9c1755faa25a62011e8fa3f14b7d74014651b421f5a0c6fb269fb6c05f23b97a5b1ed13929e8141e1c3839f784a5b'
        '01dbc4cad102535504eace2d9da225a481b62785d37365f1dea2d1210990ca6177485aa0134a074c09d253b539f12ae810706a77a46779ddb7dd4f1b9b934011'
        '4cd61fe8874528a806669e7aebdd8b03069d5da1d78594eb136f0956964660d3a28ee391fa67fb774f58636c4f32ff4e24e9c98b268a869bb6b2a4aa94771c06'
        '13405c8786ddf4be86592054ce8be246b3d8bb041d23825eb5ac08188527309b511d24ccd408fdb56f1dae25defba3f7c1ee70c9d44e937e902f7e63f5dc2f06'
        'b53bbe532f9a7583bfbcc9436f2172f2dcaa75177c1480753a2a60d97a2fbd5bfb86b97b3f7c27d82e88eb2035c6607abb7e35d39a42e6a2d40c0b54d7c430ef'
        '0c1e145109de9a25339633b563e47f6c09ea314f636023d09a58559a499dd0bd283a45e050fc99fe34c4d712bd00a035064fa8406734d57029c67b9adb4b11ce')
_arch_list=(AArch64 RiscV64 X64)
_build_type=RELEASE
_build_plugin=GCC

prepare() {
  local submodule

  cd $pkgbase

  git submodule init
  git config submodule.CryptoPkg/Library/OpensslLib/openssl.url ../openssl
  git config submodule.SoftFloat.url ../berkeley-softfloat-3
  git config submodule.UnitTestFrameworkPkg/Library/CmockaLib/cmocka.url ../$pkgbase-cmocka
  git config submodule.MdeModulePkg/Universal/RegularExpressionDxe/oniguruma.url ../oniguruma
  git config submodule.MdeModulePkg/Library/BrotliCustomDecompressLib/brotli.url ../brotli
  git config submodule.BaseTools/Source/C/BrotliCompress/brotli.url ../brotli
  git config submodule.RedfishPkg/Library/JsonLib/jansson.url ../jansson
  git config submodule.UnitTestFrameworkPkg/Library/GoogleTestLib/googletest.url ../googletest
  git config submodule.UnitTestFrameworkPkg/Library/SubhookLib/subhook.url ../$pkgbase-subhook
  git config submodule.MdePkg/Library/BaseFdtLib/libfdt.url ../pylibfdt
  git config submodule.MdePkg/Library/MipiSysTLib/mipisyst.url ../public-mipi-sys-t
  git config submodule.CryptoPkg/Library/MbedTlsLib/mbedtls.url ../mbedtls
  git config submodule.SecurityPkg/DeviceSecurity/SpdmLib/libspdm.url ../libspdm
  git -c protocol.file.allow=always submodule update

  # submodule setup for CryptoPkg/Library/OpensslLib/openssl
  submodule=CryptoPkg/Library/OpensslLib/openssl
  git -C $submodule submodule init
  git -C $submodule config submodule.pyca.cryptography.url "$srcdir/pyca-cryptography"
  git -C $submodule config submodule.krb5.url "$srcdir/krb5"
  git -C $submodule config submodule.gost-engine.url "$srcdir/gost-engine"
  git -C $submodule config submodule.wycheproof.url "$srcdir/wycheproof"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for CryptoPkg/Library/OpensslLib/openssl/gost-engine
  submodule=CryptoPkg/Library/OpensslLib/openssl/gost-engine
  git -C $submodule submodule init
  git -C $submodule config submodule.libprov.url "$srcdir/libprov"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for MdePkg/Library/MipiSysTLib/mipisyst
  submodule=MdePkg/Library/MipiSysTLib/mipisyst
  git -C $submodule submodule init
  git -C $submodule config submodule.external/pugixml.url "$srcdir/pugixml"
  git -C $submodule config submodule.external/googletest.url "$srcdir/googletest"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  submodule=SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  git -C $submodule submodule init
  git -C $submodule config submodule.os_stub/openssllib/openssl.url "$srcdir/openssl"
  git -C $submodule config submodule.os_stub/mbedtlslib/mbedtls.url "$srcdir/mbedtls"
  git -C $submodule config submodule.unit_test/cmockalib/cmocka.url "$srcdir/cmocka"
  git -C $submodule -c protocol.file.allow=always submodule update

  # -Werror, not even once
  sed -e 's/ -Werror//g' -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  local _arch
  local _build_options=()
  # shared targets for all
  local _common_args=(
    -b "$_build_type"
    -n "$(nproc)"
    -t "$_build_plugin"
  )
  # shared options for all EFI binaries
  local _efi_args=(
    -D FD_SIZE_4MB
    -D NETWORK_HTTP_BOOT_ENABLE
    -D NETWORK_IP6_ENABLE
    -D TPM_ENABLE
    -D TPM1_ENABLE
    -D TPM2_ENABLE
  )
  # network TLS for some targets (all but )
  local _network_tls=(
    -D NETWORK_TLS_ENABLE
  )

  cd $pkgbase
  # This is used as the prefix for both gcc and objcopy
  # so it cannot be set to x86_64-linux-gnu-
  # (binutils does not provide x86_64-linux-gnu-objcopy)
  export GCC_BIN=""
  export GCC_AARCH64_PREFIX="aarch64-linux-gnu-"
  export GCC_RISCV64_PREFIX="riscv64-linux-gnu-"
  echo "Building base tools"
  make -C BaseTools
  # expose build tooling in PATH
  . edksetup.sh

  for _arch in "${_arch_list[@]}"; do
    # shell
    echo "Building shell ($_arch)."
    _build_options=(
      -p ShellPkg/ShellPkg.dsc
      -a "${_arch^^}"
      "${_common_args[@]}"
    )
    BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"

    # ovmf
    case "$_arch" in
      X64)
      echo "Building ovmf ($_arch) with microvm support (4MB FD)"
      _build_options=(
        -p OvmfPkg/Microvm/Microvm$_arch.dsc
        -a "$_arch"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        "${_network_tls[@]}"
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      mv -v Build/MicrovmX64{,-4mb}

      echo "Building ovmf ($_arch) with secure boot support (4MB FD)"
      _build_options=(
        -p OvmfPkg/OvmfPkgIa32X64.dsc
        -a IA32
        -a "$_arch"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        "${_network_tls[@]}"
        -D SECURE_BOOT_ENABLE
        -D SMM_REQUIRE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      mv -v Build/Ovmf3264{,-secure-4mb}

      echo "Building ovmf (${_arch}) without secure boot (4MB FD)"
      _build_options=(
        -p "OvmfPkg/OvmfPkg$_arch.dsc"
        -a "$_arch"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        "${_network_tls[@]}"
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      mv -v Build/OvmfX64{,-4mb}
      ;;
      AArch64)
      echo "Building ArmVirtPkg ($_arch) with secure boot"
      local _build_options=(
        -p ArmVirtPkg/ArmVirtQemu.dsc
        -a "${_arch^^}"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        "${_network_tls[@]}"
        -D SECURE_BOOT_ENABLE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      local _file
      for _file in QEMU_EFI.fd QEMU_VARS.fd; do
        dd if=/dev/null of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/${_file} bs=1M seek=64
      done
      ;;
      RiscV64)
      echo "Building ovmf ($_arch) with secure boot"
      local _build_options=(
        -p OvmfPkg/RiscVVirt/RiscVVirtQemu.dsc
        -a "${_arch^^}"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        "${_network_tls[@]}"
        -D SECURE_BOOT_ENABLE
        -D SECURE_BOOT_DEFAULT_KEYS=FALSE
      )

      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      local _file
      for _file in RISCV_VIRT_CODE.fd RISCV_VIRT_VARS.fd; do
        dd if=/dev/null of=Build/RiscVVirtQemu/${_build_type}_$_build_plugin/FV/${_file} bs=1M seek=32
      done
      ;;
    esac
  done
}

package_edk2-aarch64() {
  local _arch=AArch64

  pkgdesc="Firmware for Virtual Machines (aarch64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"
  conflicts=('edk2-armvirt<202211')
  provides=(edk2-armvirt)
  replaces=('edk2-armvirt<202211')

  cd $pkgbase
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_EFI.fd "$pkgdir/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # add symlink for the lowercase UEFI machine type short-name
  ln -svT 'aarch64' "$pkgdir/usr/share/$pkgbase/aa64"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # add symlink for previous aarch64 location
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/$pkgbase-armvirt"
}

package_edk2-riscv64() {
  local _arch=RiscV64

  pkgdesc="Firmware for Virtual Machines (riscv64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/RiscVPkg"

  cd $pkgbase
  install -vDm 644 Build/RiscVVirtQemu/${_build_type}_${_build_plugin}/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_edk2-shell() {
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'

  pkgdesc="EDK2 UEFI Shell"
  provides=(uefi-shell)

  cd $pkgbase
  for _arch in "${_arch_list[@]}"; do
    install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch^^}/Shell_$_min.efi" "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell.efi"
    install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch^^}/Shell_$_full.efi" "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell_Full.efi"
  done
  # add symlink for the lowercase UEFI machine type short-name "aa64"
  if [[ -d "$pkgdir/usr/share/$pkgname/aarch64" ]]; then
    ln -svT 'aarch64' "$pkgdir/usr/share/$pkgname/aa64"
  fi
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # docs
  install -vDm 644 {ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_edk2-ovmf() {
  local _arch=X64

  pkgdesc="Firmware for Virtual Machines (x86_64, i686 on x86_64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/OVMF"
  provides=(ovmf)
  conflicts=(ovmf)
  replaces=(ovmf)
  install=$pkgname.install

  cd $pkgbase
  # installing OVMF.fd for xen: https://bugs.archlinux.org/task/58635
  install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF.4m.fd"
  install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.4m.fd"
  install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_VARS.4m.fd"
  install -vDm 644 Build/Ovmf3264-secure-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.secboot.4m.fd"
  install -vDm 644 Build/MicrovmX64-4mb/${_build_type}_${_build_plugin}/FV/MICROVM.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/MICROVM.4m.fd"
  # installing qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  # https://bugs.archlinux.org/task/64206
  install -vDm 644 ../*$pkgname*.json -t "$pkgdir/usr/share/qemu/firmware/"
  # add symlink for previous ovmf locations
  # https://bugs.archlinux.org/task/66528
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/ovmf"
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/$pkgbase-ovmf"
  # adding a symlink for applications with questionable heuristics (such as lxd)
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 OvmfPkg/License.txt "$pkgdir/usr/share/licenses/$pkgname/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}
