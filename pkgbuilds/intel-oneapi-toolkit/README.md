# Intel OneAPI Toolkit

OneAPI packages are distributed in binary form. Hence we need to fetch the prebuilt
packages from Intel's mirrors.

## Updating the Source Array

Run `update_pkgver` to update `pkgver` in `PKGBUILD` and to generate the source
array.

## Nvchecker Integration

We use `"manual"` for now as it is very difficult to map the `pkgver` onto
the link in the source array.
