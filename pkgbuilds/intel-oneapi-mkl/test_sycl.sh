#! /usr/bin/bash

OUT=$(mktemp -d)
source /opt/intel/oneapi/setvars.sh --force
icpx -fsycl -qmkl test_sycl.cpp -o $OUT/test
ldd $OUT/test
$OUT/test
