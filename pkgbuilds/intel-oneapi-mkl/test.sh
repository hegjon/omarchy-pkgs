#! /usr/bin/bash

OUT=$(mktemp -d)
gcc -I /opt/intel/oneapi/mkl/latest/include test.c -o $OUT/test -L /opt/intel/oneapi/mkl/latest/lib -lmkl_rt
ldd $OUT/test
$OUT/test
