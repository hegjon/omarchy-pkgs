# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2025.12.2
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64)
license=('BSD-3-Clause AND ISC')
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
b2sums=('284584e043404a65bbc2f04fcd78e9db4b1e844343a5fe1fd463e1021e92e7dcddbf8e5a8b620ca1e25d77a2469dec1804a0bafea02d3bcbfe175f64a92816a1')

prepare() {
  cd sof-bin-$pkgver
  sha256sum -c sha256sum.txt
}

package_sof-firmware() {
  options+=(!strip)

  local fwdir="$pkgdir/usr/lib/firmware/intel"
  mkdir -p "$fwdir"

  cd sof-bin-$pkgver

  cp -at "$fwdir" sof*

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

package_sof-tools() {
  pkgdesc+=" - tools"
  depends=(
    alsa-lib
    glibc
    python
  )

  cd sof-bin-$pkgver

  install -Dt "$pkgdir/usr/bin" tools/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

# vim:set sw=2 sts=-1 et:
