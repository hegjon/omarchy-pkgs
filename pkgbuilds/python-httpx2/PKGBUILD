# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=python-httpx2
pkgname=(
  python-httpx2
  python-httpcore2
)
pkgver=2.3.0
pkgrel=1
pkgdesc="A next generation HTTP client for Python"
arch=(any)
url="https://github.com/pydantic/httpx2"
license=(BSD-3-Clause)
makedepends=(
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-uv-dynamic-versioning
)
checkdepends=(
  python-anyio
  python-brotli
  python-brotlicffi
  python-chardet
  python-click
  python-cryptography
  python-h11
  python-h2
  python-idna
  python-pygments
  python-pytest
  python-pytest-httpbin
  python-pytest-trio
  python-rich
  python-socksio
  python-trio
  python-trustme
  python-truststore
  python-werkzeug
  python-zstandard
  uvicorn
)
source=("$pkgbase::git+$url#tag=v$pkgver")
sha512sums=('be9278d0f8306415041fc512f9fac66b14b505836383a5fdebf4e27177bb8360cfdeb3de13145ac607bba8d18f22271ef6431e93f320ab9f85c8dddae752de65')
b2sums=('bbba0ff5bafea725d56557b9dec04b6dd4ebd49a09e74c98e3613f7b0c021e24000a4c665c89fae6f5c6e84ec17cc2a177f65f641323cc5d718956bb78aaf575')

build() {
  cd $pkgbase
  python -m build --wheel --no-isolation --outdir dist src/httpcore2
  python -m build --wheel --no-isolation --outdir dist src/httpx2
}

check() {
  local pytest_args=(
    -m "not network and not benchmark"
    # These autodetect/charset tests assert the exact result returned by
    # chardet's heuristics, which varies between chardet releases.
    --deselect tests/httpx2/client/test_client.py::test_client_decode_text_using_autodetect
    --deselect tests/httpx2/client/test_client.py::test_client_decode_text_using_explicit_encoding
    --deselect tests/httpx2/models/test_responses.py::test_response_decode_text_using_autodetect
    --deselect tests/httpx2/models/test_responses.py::test_response_no_charset_with_cp_1252_content
    --deselect tests/httpx2/test_decoders.py::test_text_decoder_with_autodetect
  )

  cd $pkgbase
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_args[@]}"
}

package_python-httpx2() {
  depends=(
    python
    python-httpcore2
    python-idna
    python-truststore
  )
  optdepends=(
    'python-brotli: for brotli response decompression'
    'python-brotlicffi: for brotli response decompression'
    'python-click: command line client support'
    'python-h2: HTTP/2 support'
    'python-pygments: command line client support'
    'python-rich: command line client support'
    'python-socksio: SOCKS proxy support'
    'python-trio: alternative async library'
    'python-zstandard: for zstd response decompression'
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/httpx2-*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

package_python-httpcore2() {
  pkgdesc="A minimal low-level HTTP client for Python"
  depends=(
    python
    python-h11
    python-truststore
  )
  optdepends=(
    'python-anyio: asyncio support'
    'python-h2: HTTP/2 support'
    'python-socksio: SOCKS proxy support'
    'python-trio: trio async support'
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/httpcore2-*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
