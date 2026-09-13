#! /usr/bin/bash

OUT=$(mktemp -d)
CFG=$(PKG_CONFIG_PATH=PKG_CONFIG_PATH=/opt/intel/oneapi/tbb/latest/lib/pkgconfig pkg-config --libs --cflags tbb)
RPATH=-Wl,-rpath,/opt/intel/oneapi/tbb/latest/lib
g++ test.cpp $CFG $RPATH -o $OUT/test
ldd $OUT/test
$OUT/test
