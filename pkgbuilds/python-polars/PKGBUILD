# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Alexandre Bury <alexandre.bury@gmail.com>

pkgbase=python-polars
pkgname=($pkgbase $pkgbase-runtime-{32,64,compat})
pkgver=1.44.1
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
options=('!lto')
makedepends=(
    # Dep for the runtime
    'zstd'
    # For building the native extensions
    'maturin'
    'rustup'
    'python-installer'
    # For building the python package
    'python-build'
    'python-wheel'
    'python-setuptools'
)
checkdepends=('python-pytest'
              'python-pytest-xdist'
              'python-matplotlib'
              'python-hypothesis'
              'python-pandas'
              'python-pyarrow'
              'python-pydantic'
              'python-fsspec'
              'python-sqlalchemy'
              'python-zstandard'
              'python-cloudpickle'
              'python-aiosqlite'
              'python-boto3'
              'python-orjson'
              'python-altair'
              'python-arrow-adbc-driver-sqlite')
_name=${pkgname#python-}
_tag="py-$pkgver"
source=("https://github.com/pola-rs/polars/archive/refs/tags/$_tag.tar.gz")
b2sums=('89ec944d6e60369246be9bffe50169c4814f113980a90c1c3670d2f94fdabea738854a978cf7e717bd8710a4f16cf9e138b298fa16eb7844d65bd00745f84c43')

prepare() {
    cd polars-$_tag/py-polars

    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path runtime/polars-runtime-32/Cargo.toml
}

build() {
    local runtime
    cd polars-$_tag/py-polars
    python -m build --wheel --no-isolation

    export ZSTD_SYS_USE_PKG_CONFIG=1
    for runtime in 32 64 compat; do
        maturin build -o dist --compression-enable-large-file-support --release --locked --strip --compatibility linux --manifest-path runtime/polars-runtime-$runtime/Cargo.toml
    done
}

check() {
    cd polars-$_tag/py-polars

    # Package needs to be installed to run the tests, use a venv
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/polars_runtime_32*.whl
    test-env/bin/python -m installer dist/polars-*.whl


    # Ignore several test files as they either use unpackaged dependencies, or
    # contain direct errors
    local _pytest_args=(
        # Add 'not may_fail_auto' to the default markers because it may in fact fail
        -m "not slow and not write_disk and not release and not docs and not hypothesis and not benchmark and not ci_only and not may_fail_auto_streaming"
        # Unknown test failure
        --deselect tests/unit/operations/namespaces/array/test_array.py::test_array_idx_size_limit_eval
        # Requires unpackaged python-deltalake
        --ignore tests/unit/io/test_delta.py
        --ignore tests/unit/io/test_delta_deletion_vector.py
        --deselect tests/unit/io/test_hive.py::test_hive_decode_reserved_ascii_23241
        --deselect tests/unit/io/test_hive.py::test_hive_decode_utf8_23241
        # Requires three additional deps and tests don't run
        # https://github.com/pola-rs/polars/issues/16910
        --ignore tests/unit/io/cloud/test_aws.py
        # Requires several excel libraries, not all packaged, and annoying to filter individually
        --ignore tests/unit/io/test_spreadsheet.py
        # Requires unpackaged python-pyiceberg
        --ignore tests/unit/io/test_iceberg.py
        # Requires unpackaged python-connectorx
        --deselect "tests/unit/io/database/test_read.py::test_read_database_cx_credentials"
        # Deprecation warning, yet to be fixed
        -W ignore::DeprecationWarning
    )

    test-env/bin/python -P -m pytest tests/unit "${_pytest_args[@]}"
}

package_python-polars() {
    # note: changing the arch for the main package causes pkgctl to not detect the release correctly.
    # arch=('any')
    depends=('python' 'python-numpy' 'python-polars-runtime')
    optdepends=('python-pandas: for interoperability with pandas frames'
                'python-pyarrow: for interoperability with arrow types'
                'python-pytz: to enable conversion to python datetimes with timezones'
                'python-fsspec: to transparently open files locally or remotely')

    cd polars-$_tag/py-polars
    python -m installer -d "$pkgdir" ./dist/polars-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

_package_runtime() {
    local runtime=$1
    arch=("x86_64")
    depends=('zstd' 'glibc' 'libgcc' 'python')
    provides=(python-polars-runtime)
    pkgdesc="$pkgdesc, runtime libraries$2"

    cd polars-$_tag/py-polars
    python -m installer -d "$pkgdir" ./dist/polars_runtime_${runtime}*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_python-polars-runtime-32() {
  _package_runtime 32 ""
}


package_python-polars-runtime-compat() {
  _package_runtime compat ", older CPU compatibility"
}

package_python-polars-runtime-64() {
    _package_runtime 64 ", large dataset support"
}
