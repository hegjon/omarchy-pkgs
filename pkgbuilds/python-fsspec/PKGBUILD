# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-fsspec
pkgver=2026.7.0
pkgrel=1
pkgdesc='Specification that python filesystems should adhere to'
arch=(any)
url='https://github.com/intake/filesystem_spec'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  git
  jupyter-notebook
  python-aiohttp
  python-cloudpickle
  python-dask
  python-distributed
  python-fastparquet
  # python-fusepy
  python-jinja
  python-libarchive-c
  python-lz4
  python-msgpack
  python-numpy
  python-pandas
  python-paramiko
  python-pyarrow
  python-pyftpdlib
  python-pygit2
  python-pytest
  python-pytest-asyncio
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-vcr
  python-requests
  python-smbprotocol
  python-snappy
  python-tqdm
)
optdepends=(
  'python-aiohttp: HTTP support'
  'python-distributed: Dask support'
  'python-libarchive-c: archives support'
  'python-lz4: LZ4 compression support'
  'python-paramiko: SFTP support'
  'python-pyarrow: Arrow/Parquet support'
  'python-pygit2: git support'
  'python-requests: web protocols support'
  'python-smbprotocol: SMB support'
  'python-snappy: snappy compression support'
  'python-tqdm: progress bar support'
)
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('8b8f61af4cbbc96a108ecc1408abc268a8e98bcddc6692e20bfbb67e4c6fc714efef25614e649d82731ebfd3199d73ef6968f6eff470e1e0ce254c6712ed01c7')
b2sums=('7723723170e9d6d93e5fb02da1cae8acebc49938c9d128e4e7fba34e2a3e9254b48c3c98374a64a3c76088fb14a8c00fd1c39af9191f617f7e1a994565f39535')

build() {
  cd $pkgname
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # Deselect failing tests - I think the root cause for most of them is the
  # following requirement: "The full fsspec suite requires a system-level
  # docker, docker-compose, and fuse installation". See:
  # https://github.com/fsspec/filesystem_spec?tab=readme-ov-file#testing
  pytest \
    --deselect fsspec/implementations/tests/test_ftp.py::test_basic \
    --deselect fsspec/implementations/tests/test_ftp.py::test_ls_root_dircache \
    --deselect fsspec/implementations/tests/test_ftp.py::test_not_cached \
    --deselect fsspec/implementations/tests/test_ftp.py::test_tls \
    --deselect fsspec/implementations/tests/test_http.py \
    --deselect fsspec/implementations/tests/test_reference.py::test_defaults \
    --deselect fsspec/implementations/tests/test_reference.py::test_info \
    --deselect fsspec/implementations/tests/test_reference.py::test_simple \
    --deselect fsspec/implementations/tests/test_reference.py::test_simple_ver1 \
    --deselect fsspec/tests/test_caches.py::test_background \
    --deselect fsspec/tests/test_generic.py::test_cat_async \
    --deselect fsspec/tests/test_generic.py::test_cp_async_to_sync \
    --deselect fsspec/tests/test_generic.py::test_remote_async_ops \
    --deselect fsspec/tests/test_spec.py::test_cache_not_pickled
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
