# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=python-passlib
pkgver=1.7.4
pkgrel=13
pkgdesc="A password hashing library for Python"
arch=('any')
url="https://passlib.readthedocs.io/en/stable"
license=(BSD-3-Clause)
depends=("python")
optdepends=("python-fastpbkdf2: accelerate PBKDF2-based hashes"
            "python-bcrypt: accelerate Bcrypt hashes"
            "python-scrypt: accelerate SCrypt hashes")
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-bcrypt' 'python-django' 'python-fastpbkdf2' 'python-scrypt')
source=("https://pypi.io/packages/source/p/passlib/passlib-$pkgver.tar.gz"
        python-passlib-bcrypt.patch
        python-passlib-bcrypt-fix-tests.patch
        remove-pkg_resources.patch
        python-passlib-python-3.13.patch
        python-passlib-django.patch)
sha512sums=('350bd6da5ac57e6c266ffe8bf9684c8c2cce3fc6b513eb6c7bc1b302d2d8a1b701e9c01c953782520a2ac37b7ec1f6d7bd5855f99f6ee0e2dbbf33f2d49a9530'
            'd5399fdcdedcec9b0cdca97cd855d8f8922e8f51f11dff02dd061553923bece3c1740e1bf8e33bcc0f37fcd3a1b1a98b24572a66eb45201de03f1a9226ded0ab'
            '8367d793e55ef2cd46d3494053b87b1250c8886358f0bc146bb75b3d555d2adcc9bdb3b95adcaaa1ee88619f2730b28d28ffdb50f5a07bf623939b5257dc17a1'
            '1cca1d6ee53be6ddef8744171fd81006be91b80fd4d0a4f35ed242879cb05b56b37b5675d4fcb377f44938b5fc97499908b9ef1bcfc7355cedf48a95cbea52da'
            'a08ad8715dbf6cb3baeda127239d941816a2210850cbeaa5f2e618e7aa9f87bf6ee8a031f3214cc15a45a8eee468c653a0f7c1166b0f09318f1e10828bdc907e'
            '864e13fa6e736adbd841cfd517715f7c64ffa47ef516b890068e97c684c66253b8ba08e9177f139ca5fa543cf622b3cd73100c1a3172f1e82c3bf28b20b4d701')

prepare() {
  cd "$srcdir"/passlib-$pkgver

  patch -Np1 -i ../python-passlib-bcrypt.patch
  patch -Np1 -i ../python-passlib-bcrypt-fix-tests.patch
  patch -Np1 -i ../remove-pkg_resources.patch
  patch -Np1 -i ../python-passlib-python-3.13.patch
  patch -Np1 -i ../python-passlib-django.patch
}

build() {
  cd "$srcdir"/passlib-$pkgver
  python -m build --wheel --no-isolation
}


check() {
  export PASSLIB_TEST_MODE=full

  cd "$srcdir"/passlib-$pkgver
  pytest
}

package() {
  cd passlib-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
