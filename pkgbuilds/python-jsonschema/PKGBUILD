# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python-jsonschema
pkgver=4.26.0
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=(any)
url='https://github.com/python-jsonschema/jsonschema'
license=(MIT)
depends=(
  python
  python-attrs
  python-referencing
  python-jsonschema-specifications
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-hatch-vcs
  python-hatch-fancy-pypi-readme
)
checkdepends=(
  python-pip
  python-twisted
  python-isoduration
  python-fqdn
  python-idna
  python-jsonpointer
  python-jsonpath-ng
  python-rfc3339-validator
  python-rfc3987
  python-uri-template
  python-webcolors
)
optdepends=(
  'python-isoduration: for duration format'
  'python-fqdn: for hostname format'
  'python-idna: for idn-hostname format'
  'python-jsonpointer: for json-pointer & relative-json-pointer format'
  'python-rfc3339-validator: for date-time format'
  'python-rfc3987: for iri, iri-reference, uri & uri-reference format'
  'python-uri-template: for uri-template format'
  'python-webcolors: for color format'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('c6e138300bc213607e2647f961204b0a459f5faa895a522594ee525b59ec5ea9d67be397c1b54bf4487f09423b318e65bd5d6aa461e876464a39dcac6a895109')
b2sums=('ca1a6121b2e9ed52a17dda03648a44b97cee300868dcdc8847f160bef9bb11c3b0b65ab14ba6be2f0e21bc1fb4e9c4589db4440ef4f7e603ecd434d3348696fc')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  PYTHONPATH="$PWD/tmp_install$site_packages" \
    JSON_SCHEMA_TEST_SUITE=json trial jsonschema
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
