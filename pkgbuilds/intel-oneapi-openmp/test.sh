#! /usr/bin/bash

OUT=$(mktemp -d)
CFG=$(PKG_CONFIG_PATH=PKG_CONFIG_PATH=/opt/intel/oneapi/compiler/latest/lib/pkgconfig pkg-config --libs --cflags openmp)
gcc test.c $CFG -o $OUT/test
ldd $OUT/test
$OUT/test
