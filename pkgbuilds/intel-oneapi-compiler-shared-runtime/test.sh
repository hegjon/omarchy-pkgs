#!/usr/bin/env sh

OUT=$(mktemp -d)
CC=/usr/bin/gcc

$CC -o "$OUT/test" test.c -L/opt/rocm/lib -lOpenCL -lm
ldd "$OUT/test"
"$OUT"/test
