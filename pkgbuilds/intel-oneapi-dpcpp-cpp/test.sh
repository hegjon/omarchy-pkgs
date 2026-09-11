#! /usr/bin/env sh

OUT=$(mktemp -d)
/opt/intel/oneapi/compiler/latest/bin/icpx -fsycl test.cpp -o "$OUT"/test
ldd "$OUT"/test
"$OUT"/test
