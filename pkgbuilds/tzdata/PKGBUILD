# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=tzdata
pkgver=2026d
_tzcode=2026d
_tzdata=2026d
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data"
arch=('x86_64')
url="https://www.iana.org/time-zones"
license=('LicenseRef-tz')
optdepends=('bash: for tzselect'
            'glibc: for zdump, zic')
options=('!emptydirs')
source=(https://www.iana.org/time-zones/repository/releases/tzcode${_tzcode}.tar.gz{,.asc}
        https://www.iana.org/time-zones/repository/releases/${pkgname}${_tzdata}.tar.gz{,.asc})
sha512sums=('42d4b37549a35893187851187cae93c811928f808c24ac0003bf0b782837d0934f2f7da7e93a0417273c7e0a66f79e9d512290ae4811cb73a7d02b62b3f0fed1'
            'SKIP'
            '1a27de5af50bbc28a2f64c506ab3678b09d9e5ab6c118f39eb38bb823aa8f57069bf5e465848e71df8274c6b8bcd0fc736a88107e5792d816a1db5d867cbc219'
            'SKIP')
validpgpkeys=('7E3792A9D8ACF7D633BC1588ED97E90E62AA7E34') # Paul Eggert <eggert@cs.ucla.edu>

_timezones=('africa' 'antarctica' 'asia' 'australasia'
           'europe' 'northamerica' 'southamerica'
           'etcetera' 'backward' 'factory')

prepare() {
  sed -i "s:sbin:bin:g" Makefile
}

build() {
  make LFLAGS="${LDFLAGS} ${LTOFLAGS}"
}

package() {
  cd "${srcdir}"
  # install tzcode stuff
  make DESTDIR="${pkgdir}" install

  # install tzdata stuff
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo ${_timezones[@]}
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo/posix ${_timezones[@]}
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo/right -L leapseconds ${_timezones[@]}
  # This creates the posixrules file. We use New York because POSIX requires the daylight savings time rules to be in accordance with US rules.   
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo -p America/New_York
  install -m644 -t "${pkgdir}"/usr/share/zoneinfo iso3166.tab leap-seconds.list zone1970.tab zone.tab SECURITY # zone.tab is depricated and will go soon
  
  # cleanup
  rm "${pkgdir}/etc/localtime"

  # install license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
