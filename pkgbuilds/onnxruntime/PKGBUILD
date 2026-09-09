# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgbase=onnxruntime
pkgname=(
  "${pkgbase}-cpu"
  "${pkgbase}-cuda"
  "${pkgbase}-opt-cuda"
  "${pkgbase}-rocm"
  "${pkgbase}-opt-rocm"
  "python-${pkgbase}-cpu"
  "python-${pkgbase}-cuda"
  "python-${pkgbase}-opt-cuda"
  "python-${pkgbase}-rocm"
  "python-${pkgbase}-opt-rocm"
)
pkgver=1.29.0
_pkgdesc='Cross-platform, high performance scoring engine for ML models'
pkgrel=3
arch=('x86_64')
url='https://github.com/microsoft/onnxruntime'
license=('MIT')
# https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/transformers/requirements.txt
_pydepends=('python-numpy' 'python-psutil' 'python-py-cpuinfo' 'python-sympy'
            'python-scipy' 'python-pillow' 'python-flatbuffers'
            'python-protobuf' 'python-packaging')
depends=('cpuinfo' 'protobuf' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'ninja' 'boost' 'pybind11' 'nlohmann-json' 'chrono-date' 'cxxopts'
             'protobuf' 'microsoft-gsl' 'eigen' 'dlpack' 'safeint'
             'python-setuptools' 'python-installer' 'python-wheel' 'python-build' 'onednn'
             'cuda' 'cudnn' 'cudnn-frontend' 'nccl'
             'rocm-toolchain' 'rocm-hip-sdk' 'hipify-clang' 'rocm-smi-lib' 'roctracer' 'migraphx')
makedepends+=("${_pydepends[@]}")
# onnxruntime uses internal files of abseil and tensorboard,
# so we cannot use the binary Arch Linux packages and need to build them
# from source as part of ONNX runtime.
# onnx is likewise built from its pinned source (_onnx_ver) rather than the
# system package: onnx ships no generated onnx.pb.h, so its ABI is realized
# against whatever protobuf/abseil it was last built with. A system onnx
# rebuilt against a newer toolchain than onnxruntime's bundled abseil yields
# undefined-symbol link failures, so we pin and vendor it here.
# TODO Check for new versions in cmake/deps.txt with every onnxruntime release
# _abseil_ver must match the abseil-cpp package, not deps.txt (20250814.0):
# protobuf 36 exports HandleAddOverflow(absl::int128), mangled per abseil LTS.
_abseil_ver=20260817.0
_tensorboard_ver=373eb09e4c5d2b3cc2493f0949dc4be6b6a45e81
_re2_ver=2024-07-02
_flatbuffers_ver=23.5.26
_cutlass_ver=4.4.2
_onnx_ver=1.22.0
source=("git+https://github.com/microsoft/onnxruntime#tag=v${pkgver}"
        "${pkgbase}-abseil-cpp-${_abseil_ver}.tar.gz::https://github.com/abseil/abseil-cpp/archive/refs/tags/${_abseil_ver}.tar.gz"
        "${pkgbase}-tensorboard-${_tensorboard_ver}.tar.gz::https://github.com/tensorflow/tensorboard/archive/${_tensorboard_ver}.tar.gz"
        "${pkgbase}-re2-${_re2_ver}.tar.gz::https://github.com/google/re2/archive/refs/tags/${_re2_ver}.tar.gz"
        "${pkgbase}-flatbuffers-${_flatbuffers_ver}.tar.gz::https://github.com/google/flatbuffers/archive/refs/tags/v${_flatbuffers_ver}.tar.gz"
        "${pkgbase}-cutlass-${_cutlass_ver}.tar.gz::https://github.com/NVIDIA/cutlass/archive/refs/tags/v${_cutlass_ver}.tar.gz"
        "${pkgbase}-onnx-${_onnx_ver}.tar.gz::https://github.com/onnx/onnx/archive/refs/tags/v${_onnx_ver}.tar.gz"
        "${pkgbase}-install-orttraining-files.patch"
        "${pkgbase}-system-dnnl.patch"
        "${pkgbase}-system-flatbuffers.patch"
        "${pkgbase}-remove-pkg_resources.patch"
        fix-thrust-api.patch
        use-system-boost-mp11.patch
        onnxruntime-cutlass-4.4.2.patch
        onnxruntime-cuda-softmax-stream.patch
        onnxruntime-drop-sharded-moe.patch)
b2sums=('8fdc31605d139480199860fc303a537bf67635bf60eb1d40e850b0270b422b070855cf416e9ca774889b9fba0c52fa40ad6fde0bdaf074013e2aaba89b53e054'
        '90a2dba1f88ef2ba16fe7f8ea19b5ae8895edb52b241baba987f246b9c5ef12b9012ee6c085aa89f4b86d1809b5ee74fc43aa846a9b075d4fb0b97ac2d3bbcd2'
        'eb527f92bfce897a0dba4757ebe6be11020e172b9b219aec5089645a37f9b0e5bd7a977222b20db193c11d834f6dd46a09ca3633039a4f6a84528d9b0ecce057'
        '86b915dc0b8e68b35fd0ed20bedd5e9c5781826442f332d115166a9a70f34b7e9b4ef60206264035b82652230d42a3c6aa2b91a774fca3b1e415ce65ace2ae96'
        '147425e7c018072f4ae4cdb3e034a4f434362d88d5e27b09375965993c279acfbed36064014c8f4fbe3fb81175ac0aa9b07629675e2c7ad33d59a9c85f2c3bb8'
        'd542daa5a809b1dc8cca81319b9b45437ad9965aba4d6b4fbf7a6d6477f241f0b9aa94045834977dcd16924ed88cde2c2da5795affb02290cb2247de25f0ec3e'
        '2d7c040511bd5bd4bb186c420b561b443a86be0fd38e7c2ffd3e7cfc4794c34ffb283ee0012326608abe0aadba65297c80af372ed09a6429182485d3b2dfddba'
        'af5a5524dd9b5fe0052d2d0da232de7f219d4abffb37a7a321145b428d06fcb2901ab4e76b6754440146c223fc761bcbdfeee230167d33aa4434b82a1ebad5c0'
        '619775050c51633a5431fd7ed433097241a399b6c183eeef1753b9e6eca0f741237840fc6e6268073f51b4b5744a7578266cc38901eefd004170840271a5359c'
        '207f020f310a7b447b4dc2fac74819f80099f088fdad6e42d67d0f01aa35bb5b9475bd006d9bec318127ae2db3d7ae3df33382fa16339d936c1dfb3832010837'
        'dfa9e70fdcd0f2c2fafec7f1961e66fa9661a03b8dba08c7d2329d018d8ebd4481337c0ddc6de393d7f4a032bd6011ccfad28d89aa0142ce9e01ead0bafcf079'
        '51464285b869d8c1f1703206297ead97c601ff786695c3fd24606be2eb608a1a5afe34d04d7285e22d9f6a91112a86f6fe94f8706203c31d5b9a94972202f564'
        '2f63abb217ef0f63d2f5d9985be217ad1e3b581a75ed3396b8c986b6004ce94fd116a8b5aa4f0bcfc62637004881950027bbbc57c5ccaec3bdbb7a2b529a113c'
        'dce07bc1fd5b69bd34396dcebccb022d4ae73278dbe6def23006c5ef7ce690dd7af370dcd5efbbdc9a28c7871cc2b7755d44e5171973fc0219aa80f0900962ff'
        '40cbcec058f8198c0462139eb5c4bfa251f9c58e9215fc3ce3124796717a36e13cf4197d8ee6f34e2b2b51549649d70a7c3b9214bc3504bfcb2dff043bce1510'
        '0e8bb447e6e9dcfa29b47986fc6e7585c4c1320ecdf9e3e9a3a6acb628a6892f0ae9b3d6d523e984380cb0365572aa7839ae682ba327e534d9bdc3dc896e9251')

_valid_sm() {
  # Check PKGBUILDs of python-pytorch and tensorflow for CUDA architectures built by official packages
  echo "75-real;80-real;86-real;87-real;88-real;89-real;90-real;100-real;103-real;110-real;120-real;121-real;121-virtual"
}

_valid_gfx() {
  # gfx950 is not supported by rocPRIM
  echo "$(rocm-supported-gfx -e gfx950)"
}

prepare() {
  cd "${pkgbase}"
  # Nuke -Werror flags
  find cmake/ -type f -name "*.cmake" -exec sed -i 's/-Werror//g' {} +
  find "$srcdir/abseil-cpp-${_abseil_ver}" -type f \( -name "*.cmake" -o -name "CMakeLists.txt" \) -exec sed -i 's/-Werror//g' {} +

  patch -Np1 -i "${srcdir}/${pkgbase}-system-dnnl.patch"

  patch -Np1 -i "${srcdir}/${pkgbase}-install-orttraining-files.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}-system-flatbuffers.patch"

  # Fix thrust and cub API usage
  patch -p1 -i "${srcdir}/fix-thrust-api.patch"

  # Use mp11 from system boost
  patch -p1 -i "${srcdir}/use-system-boost-mp11.patch"

  # Remove pkg_resources use
  patch -p1 -i "${srcdir}/${pkgbase}-remove-pkg_resources.patch"

  # Fix CUDA training-op build against the new SoftMaxComputeHelper signature
  # (cudaStream_t instead of onnxruntime::Stream*); see upstream commit
  # 879f65911a8 which updated softmax.cc but not the orttraining loss kernels.
  patch -p1 -i "${srcdir}/${pkgbase}-cuda-softmax-stream.patch"

  # Drop the distributed ShardedMoE CUDA op. v1.27.0's MoE refactor removed
  # contrib_ops/cuda/moe/ft_moe/moe_kernel.h (kernels moved to
  # contrib_ops/cuda/llm/moe_gemm/) but left sharded_moe.{h,cc} #including it,
  # breaking the build whenever NCCL is enabled. See upstream issue.
  patch -p1 -i "${srcdir}/${pkgbase}-drop-sharded-moe.patch"

  # Fix abseil member alias template parse/instantiation errors with the
  # CUDA 13.3 host front-end and recent GCC. Hoists IfRRef<...>::AddPtr<...>
  # to a top-level IfRRefAddPtr<...> alias template; see
  # https://github.com/abseil/abseil-cpp/issues/2075. Since v1.28.0 onnxruntime
  # ships this patch itself and applies it via abseil's PATCH_COMMAND, which is
  # skipped when FETCHCONTENT_SOURCE_DIR is set, so apply it here.
  cd "${srcdir}/abseil-cpp-${_abseil_ver}"
  patch -p1 -i "${srcdir}/${pkgbase}/cmake/vcpkg-ports/abseil/absl_cuda13_member_template.patch"

  # onnxruntime consumes the cutlass source tree (include + examples + tools)
  # directly via FetchContent, so the binary cutlass-headers package cannot
  # satisfy it; we provide the pinned cutlass source instead. The PATCH_COMMAND
  # onnxruntime would normally run is skipped when FETCHCONTENT_SOURCE_DIR is
  # set, so apply onnxruntime's cutlass 4.4.2 patch here.
  cd "${srcdir}/cutlass-${_cutlass_ver}"
  patch -p1 -i "${srcdir}/${pkgbase}-cutlass-${_cutlass_ver}.patch"

  # Build onnx from the pinned source (cmake/deps.txt v${_onnx_ver}) instead of
  # the system onnx package. onnx ships no generated onnx.pb.h; that ABI is
  # realized at build time against the current protobuf/abseil, so a system
  # onnx rebuilt against a newer toolchain than onnxruntime's bundled abseil
  # produces undefined-symbol link failures. Vendoring keeps the ABI matched.
  # As with cutlass, FETCHCONTENT_SOURCE_DIR makes onnxruntime skip its
  # PATCH_COMMAND, so apply onnxruntime's onnx patch here.
  cd "${srcdir}/onnx-${_onnx_ver}"
  patch -p1 -i "${srcdir}/${pkgbase}/cmake/patches/onnx/onnx.patch"

  cd "${srcdir}"
  cp -r "${pkgbase}" "${pkgbase}-cpu"
  cp -r "${pkgbase}" "${pkgbase}-cuda"
  cp -r "${pkgbase}" "${pkgbase}-opt-cuda"
  cp -r "${pkgbase}" "${pkgbase}-rocm"
  cp -r "${pkgbase}" "${pkgbase}-opt-rocm"
}

build() {
  # Use -Donnxruntime_ENABLE_LAZY_TENSOR=OFF as it requires patched python-pytorch
  # See: https://github.com/microsoft/onnxruntime/pull/10460 https://github.com/pytorch/pytorch/pulls/wschin
  local _cmake_args=(
    --compile-no-warning-as-error
    -S cmake
    -B build
    -Wno-dev
    -G Ninja
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -Donnxruntime_ENABLE_PYTHON=ON
    -Donnxruntime_BUILD_SHARED_LIB=ON
    -Donnxruntime_BUILD_UNIT_TESTS=OFF
    -DBUILD_TESTING=OFF
    -Donnxruntime_ENABLE_TRAINING=ON
    -Donnxruntime_ENABLE_LAZY_TENSOR=OFF
    # v1.29.0 added POSIX telemetry via the 1DS SDK (cpp_client_telemetry),
    # which would vendor curl and mbedtls as well. Off is upstream's default;
    # set explicitly so the packaged build never phones home.
    -Donnxruntime_USE_TELEMETRY=OFF
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    -DFETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS
    -DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP="$srcdir/abseil-cpp-${_abseil_ver}"
    -DFETCHCONTENT_SOURCE_DIR_TENSORBOARD="$srcdir/tensorboard-${_tensorboard_ver}"
    -DFETCHCONTENT_SOURCE_DIR_RE2="$srcdir/re2-${_re2_ver}"
    -DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS="$srcdir/flatbuffers-${_flatbuffers_ver}"
    -DFETCHCONTENT_SOURCE_DIR_CUTLASS="$srcdir/cutlass-${_cutlass_ver}"
    -DFETCHCONTENT_SOURCE_DIR_ONNX="$srcdir/onnx-${_onnx_ver}"
    -DONNX_CUSTOM_PROTOC_EXECUTABLE=/usr/bin/protoc
    -DCMAKE_CXX_STANDARD=20)

  # Use protobuf-lite instead of full protobuf to workaround symbol conflicts
  # with onnx; see https://github.com/onnx/onnx/issues/1277 for details.
  _cmake_args+=(
    -Donnxruntime_USE_FULL_PROTOBUF=OFF)

  # Silence template parsing errors
  CXXFLAGS+=" -Wno-template-body"

  CXXFLAGS+=" -I/opt/cuda/targets/x86_64-linux/include"
  # Fix gcc 16 with absl 20260526
  export CUDAFLAGS+=" -Xcompiler -Wno-error=template-body"
  local _cmake_cuda_args=("${_cmake_args[@]}"
    -DCMAKE_CUDA_ARCHITECTURES="$(_valid_sm)"
    -DCMAKE_CUDA_FLAGS="-Xcompiler -Wno-template-body"
    -DCMAKE_CUDA_STANDARD_REQUIRED=ON
    -DCMAKE_CXX_STANDARD_REQUIRED=ON
    # WARNING: too many threads will eat all your RAM
    -Donnxruntime_NVCC_THREADS=2
    -Donnxruntime_USE_DNNL=ON
    -Donnxruntime_USE_CUDA=ON
    -Donnxruntime_USE_NCCL=ON
    -Donnxruntime_CUDA_HOME=/opt/cuda
    -Donnxruntime_CUDNN_HOME=/usr)

  # Disable composable kernel support as onnxruntime doesn't work with tagged
  # upstream release.
  #
  # With USE_ROCM=ON NCCL is mapped on RCCL.
  local _cmake_rocm_args=("${_cmake_args[@]}"
    -DCMAKE_HIP_ARCHITECTURES="$(_valid_gfx)"
    -DCMAKE_HIP_FLAGS="-DHIPBLAS_USE_HIP_HALF=1 -DROCM_USE_FLOAT16=1"
    -Donnxruntime_USE_DNNL=ON
    -Donnxruntime_USE_MIGRAPHX=ON
    -Donnxruntime_USE_NCCL=ON
    -Donnxruntime_BUILD_KERNEL_EXPLORER=OFF
    -Donnxruntime_USE_COMPOSABLE_KERNEL=OFF
    -Donnxruntime_NCCL_HOME=/opt/rocm
    -Donnxruntime_ROCM_HOME=/opt/rocm)

  # For LTO everything needs to be compiled with the gcc version of CUDA
  export CXX="$NVCC_CCBIN"
  export CC="${NVCC_CCBIN/g++/gcc}"


  ##### onnxruntime-cpu
  echo "Build onnxruntime without GPU support"
  cd "${srcdir}/${pkgbase}-cpu"
  cmake "${_cmake_args[@]}"
  cmake --build build

  cp -r build/onnxruntime/* onnxruntime
  python -m build --wheel --no-isolation

  ##### onnxruntime-cuda

  echo "Build onnxruntime with CUDA without optimization"
  cd "${srcdir}/${pkgbase}-cuda"
  cmake "${_cmake_cuda_args[@]}"
  cmake --build build

  cp -r build/onnxruntime/* onnxruntime
  python -m build --wheel --no-isolation


  ##### onnxruntime-opt-cuda

  echo "Build onnxruntime with CUDA with AVX optimizations"
  cd "${srcdir}/${pkgbase}-opt-cuda"
  echo 'string(APPEND CMAKE_C_FLAGS " -march=haswell")' \
    >> cmake/adjust_global_compile_flags.cmake
  echo 'string(APPEND CMAKE_CXX_FLAGS " -march=haswell")' \
    >> cmake/adjust_global_compile_flags.cmake
  cmake "${_cmake_cuda_args[@]}"
  cmake --build build

  cp -r build/onnxruntime/* onnxruntime
  python -m build --wheel --no-isolation


  ##### onnxruntime-rocm

  echo "Build onnxruntime with ROCm without optimization"
  cd "${srcdir}/${pkgbase}-rocm"
  cmake "${_cmake_rocm_args[@]}"
  cmake --build build

  cp -r build/onnxruntime/* onnxruntime
  sed -i 's/is_migraphx = False/is_migraphx = True/g' setup.py
  python -m build --wheel --no-isolation


  ##### onnxruntime-opt-rocm

  echo "Build onnxruntime with ROCm with AVX optimizations"
  cd "${srcdir}/${pkgbase}-opt-rocm"
  echo 'string(APPEND CMAKE_C_FLAGS " -march=haswell")' \
    >> cmake/adjust_global_compile_flags.cmake
  echo 'string(APPEND CMAKE_CXX_FLAGS " -march=haswell")' \
    >> cmake/adjust_global_compile_flags.cmake
  cmake "${_cmake_rocm_args[@]}"
  cmake --build build

  cp -r build/onnxruntime/* onnxruntime
  sed -i 's/is_migraphx = False/is_migraphx = True/g' setup.py
  python -m build --wheel --no-isolation
}

package_onnxruntime-cpu() {
  pkgdesc="$_pkgdesc (CPU only)"
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-cpu"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_onnxruntime-cuda() {
  pkgdesc="$_pkgdesc (with CUDA)"
  depends+=('cuda' 'cudnn' 'cudnn-frontend' 'nccl' 'onednn')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")
  replaces=("${pkgbase}")

  cd "${pkgbase}-cuda"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_onnxruntime-opt-cuda() {
  pkgdesc="$_pkgdesc (with CUDA and AVX2 CPU optimizations)"
  depends+=('cuda' 'cudnn' 'cudnn-frontend' 'nccl' 'onednn')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")
  replaces=("${pkgbase}-opt")

  cd "${pkgbase}-opt-cuda"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_onnxruntime-rocm() {
  pkgdesc="$_pkgdesc (with ROCm)"
  depends+=('rocm-hip-sdk' 'roctracer' 'rccl' 'migraphx')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-rocm"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_onnxruntime-opt-rocm() {
  pkgdesc="$_pkgdesc (with ROCm and AVX2 CPU optimizations)"
  depends+=('rocm-hip-sdk' 'roctracer' 'rccl' 'migraphx')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-opt-rocm"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime-cpu() {
  pkgdesc="$_pkgdesc (CPU only)"
  depends+=("${_pydepends[@]}")
  provides=("python-${pkgbase}=${pkgver}")
  conflicts=("python-${pkgbase}")

  cd "${pkgbase}-cpu"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime-cuda() {
  pkgdesc="$_pkgdesc (with CUDA)"
  depends+=('cuda' 'cudnn' 'nccl' 'onednn')
  depends+=("${_pydepends[@]}")
  provides=("python-${pkgbase}=${pkgver}")
  conflicts=("python-${pkgbase}")
  replaces=("python-${pkgbase}")

  cd "${pkgbase}-cuda"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime-opt-cuda() {
  pkgdesc="$_pkgdesc (with CUDA and AVX2 CPU optimizations)"
  depends+=('cuda' 'cudnn' 'nccl' 'onednn')
  depends+=("${_pydepends[@]}")
  provides=("python-${pkgbase}=${pkgver}")
  conflicts=("python-${pkgbase}")
  replaces=("python-${pkgbase}-opt")

  cd "${pkgbase}-opt-cuda"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime-rocm() {
  pkgdesc="$_pkgdesc (with ROCm)"
  depends+=('rocm-hip-sdk' 'roctracer' 'rccl' 'migraphx')
  depends+=("${_pydepends[@]}")
  provides=("python-${pkgbase}=${pkgver}")
  conflicts=("python-${pkgbase}")

  cd "${pkgbase}-rocm"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime-opt-rocm() {
  pkgdesc="$_pkgdesc (with ROCm and AVX2 CPU optimizations)"
  depends+=('rocm-hip-sdk' 'roctracer' 'rccl' 'migraphx')
  depends+=("${_pydepends[@]}")
  provides=("python-${pkgbase}=${pkgver}")
  conflicts=("python-${pkgbase}")

  cd "${pkgbase}-opt-rocm"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
