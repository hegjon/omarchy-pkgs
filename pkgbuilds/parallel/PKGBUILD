# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=(parallel parallel-docs)
pkgver=20260722
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=(any)
url='https://www.gnu.org/software/parallel/'
license=(GPL-3.0-or-later)
makedepends=(
  git
  perl
  libreoffice-fresh
  graphviz
  jdk-openjdk
  perl-pod2pdf
  perl-pod-pom-view-restructured
  # pod2texi provided by texinfo in base-devel
)
source=(
  "$pkgname::git+https://git.savannah.gnu.org/git/parallel.git?signed#tag=${pkgver}"
  0001-Remove-citation-things.patch
)
sha512sums=('334983cc53926ccd9b991ddd8e6b11528a4a2a4d24d285d4fb0421d479c7c3eaefe46d12202eb97dbc848caf5ef2781edb7a37b3b98c4fd841886c6e936ed8ed'
            '9f36b9f518265eefeb8d701e5a548411c6daa449d0206f3214ed87cf6ec0f8cb6693e6682c8e57561d65bc9a94a24212040cee9bb7e384c043d3081118b0f248')
b2sums=('cdbe7efe3445fb7ebc56ea3797b5b3ef7e20cca3e2b4f8c9ac1e1eaf3809bd656b354574b0af0ce65b1cbeb55086a0a710ed49116231c5f81aab716d218a856c'
        '44e7f99af6a7d42fe69d1db6c43efb8273fda13ea014d39da05412ccad78e0e7fe220e0d6a94c90b141b245d5c3c2f2d6439b6208bfb89292e3d3edff2e47201')
validpgpkeys=('CDA01A4208C4F74506107E7BD1AB451688888888')

prepare() {
  cd "$pkgbase"

  # remove citation warnings
  # https://en.opensuse.org/openSUSE:Packaging_guidelines#Donation_requests
  patch -p1 -i "$srcdir/0001-Remove-citation-things.patch"

  autoreconf -fiv
}

build() {
  cd "$pkgbase"

  ./configure --prefix=/usr

  make
}

package_parallel() {
  depends=(perl procps)
  optdepends=('parallel-docs: documentation')

  cd "$pkgbase"

  make DESTDIR="$pkgdir" install

  # split documentation out of main package
  mv "$pkgdir/usr/share/doc" docs
}

package_parallel-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase"

  install -vd "$pkgdir/usr/share/doc"
  mv -v docs/* "$pkgdir/usr/share/doc"
}
# vim:set ts=2 sw=2 et:
