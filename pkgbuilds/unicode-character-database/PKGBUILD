# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=unicode-character-database
pkgver=18.0.0
pkgrel=1
pkgdesc="Unicode Character Database"
url="https://www.unicode.org/versions/Unicode$pkgver/"
arch=(any)
license=(Unicode-3.0)
source=(
  "UCD-$pkgver.zip::https://www.unicode.org/Public/$pkgver/ucd/UCD.zip"
  "Unihan-$pkgver.zip::https://www.unicode.org/Public/$pkgver/ucd/Unihan.zip"
  "unicode-license-$pkgver.txt::https://www.unicode.org/license.txt"
)
noextract=({UCD,Unihan}-$pkgver.zip)
b2sums=('679f90c246ab8eb94ba7a9a281a3cbe49cabcbeb6cf93775f7fe511a66e36cdea82db63d0ea2af34e2b57d804d13c4174cff13d288b4376089d5b97af4860a4a'
        '0d1ab2907fd399fdc7f8aae9ecd63df90407ece1ba81ce37467b33689a4ef20ae5d5bcfc6a1a7ec5b0a94f32608540cfa80f0afc3a558ff1b4df4490754081e8'
        '8e0ac44b557e3966f28c5ce443086f6cbf3ef7b7cc01f45fa9c081d186e0b6700a3155f6aa67cf7b3a13eeb25e7016fabb366e11942e4574f09c5321fff6c521')

package() {
  local x
  for x in UCD Unihan; do
    install -Dm644 $x-$pkgver.zip "$pkgdir/usr/share/unicode/$x.zip"
    bsdtar -C "$pkgdir/usr/share/unicode" -x --no-same-owner --no-same-permissions -f $x-$pkgver.zip
  done

  # FS#49938: A bunch of compatibility symlinks
  ln -s . "$pkgdir/usr/share/unicode/ucd"
  for x in $pkgname unicode-data unidata; do
    ln -s unicode "$pkgdir/usr/share/$x"
  done

  install -Dm644 unicode-license-$pkgver.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
