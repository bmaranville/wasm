# WebAssembly Playground

<!-- DO NOT EDIT README.md!

This file was auto-generated based on the template file
`cmd/write_me/write_me.tpl`. Update the template file and then re-generate
the `README.md` file by running:

$ bazel run //cmd/write_me
-->

Scripts to compile libraries to [WebAssembly] using [Bazel].

To get (somewhat) reproducible results, run the builds in a Docker container.
To get a shell within the container, run build the image and run it:

```sh
$ docker build -t wasm docker
$ docker run -it -v "${PWD}:/build" wasm
```

Then build targets as usual. To compile WebAssembly using the Emscripten
toolchain, pass `--cpu=wasm32`. Pass `-c opt` for an optimised build.

## Libraries

| Build Label | Version |
|-------------|---------|
[`//lib/bz2`](https://github.com/attilaolah/wasm/blob/main/lib/bz2/BUILD.bazel) | 1.0.8 [🔗](https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz)
[`//lib/c`](https://github.com/attilaolah/wasm/blob/main/lib/c/BUILD.bazel) | 2.33 [🔗](https://ftp.gnu.org/gnu/libc/glibc-2.33.tar.xz) [🔗](https://mirror.kumi.systems/gnu/libc/glibc-2.33.tar.xz)
[`//lib/ceres`](https://github.com/attilaolah/wasm/blob/main/lib/ceres/BUILD.bazel) | 1.14.0 [🔗](https://github.com/ceres-solver/ceres-solver/archive/1.14.0.tar.gz)
[`//lib/curl`](https://github.com/attilaolah/wasm/blob/main/lib/curl/BUILD.bazel) | 7.75.0 [🔗](https://curl.se/download/curl-7.75.0.tar.xz)
[`//lib/deflate`](https://github.com/attilaolah/wasm/blob/main/lib/deflate/BUILD.bazel) | 1.7 [🔗](https://github.com/ebiggers/libdeflate/archive/v1.7.tar.gz)
[`//lib/eigen`](https://github.com/attilaolah/wasm/blob/main/lib/eigen/BUILD.bazel) | 3.3.8-rc1 [🔗](https://gitlab.com/libeigen/eigen/-/archive/3.3.8-rc1/eigen-3.3.8-rc1.tar.bz2)
[`//lib/exiv2`](https://github.com/attilaolah/wasm/blob/main/lib/exiv2/BUILD.bazel) | 0.27.3 [🔗](https://exiv2.org/builds/exiv2-0.27.3-Source.tar.gz)
[`//lib/expat`](https://github.com/attilaolah/wasm/blob/main/lib/expat/BUILD.bazel) | 2.2.10 [🔗](https://github.com/libexpat/libexpat/releases/download/R_2_2_10/expat-2.2.10.tar.xz)
[`//lib/ffi`](https://github.com/attilaolah/wasm/blob/main/lib/ffi/BUILD.bazel) | 3.3 [🔗](https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz)
[`//lib/fftw`](https://github.com/attilaolah/wasm/blob/main/lib/fftw/BUILD.bazel) | 3.3.9 [🔗](http://www.fftw.org/fftw-3.3.9.tar.gz)
[`//lib/gcc`](https://github.com/attilaolah/wasm/blob/main/lib/gcc/BUILD.bazel) | 10.2.0 [🔗](ftp://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz) [🔗](https://mirror.kumi.systems/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz)
[`//lib/gdal`](https://github.com/attilaolah/wasm/blob/main/lib/gdal/BUILD.bazel) | 3.2.1 [🔗](https://github.com/OSGeo/gdal/releases/download/v3.2.1/gdal-3.2.1.tar.gz)
[`//lib/gflags`](https://github.com/attilaolah/wasm/blob/main/lib/gflags/BUILD.bazel) | 2.2.2 [🔗](https://github.com/gflags/gflags/archive/v2.2.2.tar.gz)
[`//lib/gif`](https://github.com/attilaolah/wasm/blob/main/lib/gif/BUILD.bazel) | 5.2.1 [🔗](https://downloads.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz)
[`//lib/glog`](https://github.com/attilaolah/wasm/blob/main/lib/glog/BUILD.bazel) | 0.4.0 [🔗](https://github.com/google/glog/archive/v0.4.0.tar.gz)
[`//lib/gmp`](https://github.com/attilaolah/wasm/blob/main/lib/gmp/BUILD.bazel) | 6.2.1 [🔗](https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz)
[`//lib/hdf`](https://github.com/attilaolah/wasm/blob/main/lib/hdf/BUILD.bazel) | 4.2.15 [🔗](https://support.hdfgroup.org/ftp/HDF/releases/HDF4.2.15/src/hdf-4.2.15.tar.gz)
[`//lib/hdf5`](https://github.com/attilaolah/wasm/blob/main/lib/hdf5/BUILD.bazel) | 1.12.0 [🔗](https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.0/src/hdf5-1.12.0.tar.gz) [🔗](https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_1_12_0/source/hdf5-1.12.0.tar.gz)
[`//lib/jpeg_turbo`](https://github.com/attilaolah/wasm/blob/main/lib/jpeg_turbo/BUILD.bazel) | 2.0.90 [🔗](https://github.com/libjpeg-turbo/libjpeg-turbo/archive/2.0.90.tar.gz)
[`//lib/lz4`](https://github.com/attilaolah/wasm/blob/main/lib/lz4/BUILD.bazel) | 1.9.3 [🔗](https://github.com/lz4/lz4/archive/v1.9.3.tar.gz)
[`//lib/lzma`](https://github.com/attilaolah/wasm/blob/main/lib/lzma/BUILD.bazel) | 5.2.5 [🔗](https://tukaani.org/xz/xz-5.2.5.tar.xz)
[`//lib/lzo`](https://github.com/attilaolah/wasm/blob/main/lib/lzo/BUILD.bazel) | 2.10 [🔗](https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz)
[`//lib/mpfr`](https://github.com/attilaolah/wasm/blob/main/lib/mpfr/BUILD.bazel) | 4.1.0 [🔗](https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.xz) [🔗](https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz)
[`//lib/oniguruma`](https://github.com/attilaolah/wasm/blob/main/lib/oniguruma/BUILD.bazel) | 6.9.6 [🔗](https://github.com/kkos/oniguruma/releases/download/v6.9.6/onig-6.9.6.tar.gz)
[`//lib/open_jpeg`](https://github.com/attilaolah/wasm/blob/main/lib/open_jpeg/BUILD.bazel) | 2.4.0 [🔗](https://github.com/uclouvain/openjpeg/archive/v2.4.0.tar.gz)
[`//lib/open_ssl`](https://github.com/attilaolah/wasm/blob/main/lib/open_ssl/BUILD.bazel) | 1.1.1i [🔗](https://www.openssl.org/source/openssl-1.1.1i.tar.gz)
[`//lib/pano13`](https://github.com/attilaolah/wasm/blob/main/lib/pano13/BUILD.bazel) | 2.9.19 [🔗](https://download.sourceforge.net/panotools/libpano13-2.9.19.tar.gz)
[`//lib/png`](https://github.com/attilaolah/wasm/blob/main/lib/png/BUILD.bazel) | 1.6.37 [🔗](https://downloads.sourceforge.net/libpng/libpng-1.6.37.tar.gz)
[`//lib/proj`](https://github.com/attilaolah/wasm/blob/main/lib/proj/BUILD.bazel) | 7.2.0 [🔗](https://download.osgeo.org/proj/proj-7.2.0.tar.gz)
[`//lib/python`](https://github.com/attilaolah/wasm/blob/main/lib/python/BUILD.bazel) | 3.9.1 [🔗](https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz)
[`//lib/readline`](https://github.com/attilaolah/wasm/blob/main/lib/readline/BUILD.bazel) | 8.0 [🔗](https://ftp.gnu.org/gnu/readline/readline-8.0.tar.gz)
[`//lib/sqlite`](https://github.com/attilaolah/wasm/blob/main/lib/sqlite/BUILD.bazel) | 3.34.1 [🔗](https://www.sqlite.org/2021/sqlite-autoconf-3340100.tar.gz)
[`//lib/suite_sparse`](https://github.com/attilaolah/wasm/blob/main/lib/suite_sparse/BUILD.bazel) | 5.8.1 [🔗](https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz)
[`//lib/szip`](https://github.com/attilaolah/wasm/blob/main/lib/szip/BUILD.bazel) | 2.1.1 [🔗](https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz)
[`//lib/tiff`](https://github.com/attilaolah/wasm/blob/main/lib/tiff/BUILD.bazel) | 4.2.0 [🔗](https://download.osgeo.org/libtiff/tiff-4.2.0.tar.gz)
[`//lib/vigra`](https://github.com/attilaolah/wasm/blob/main/lib/vigra/BUILD.bazel) | 1.11.1 [🔗](https://github.com/ukoethe/vigra/releases/download/Version-1-11-1/vigra-1.11.1-src.tar.gz)
[`//lib/webp`](https://github.com/attilaolah/wasm/blob/main/lib/webp/BUILD.bazel) | 1.1.0 [🔗](https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz)
[`//lib/z`](https://github.com/attilaolah/wasm/blob/main/lib/z/BUILD.bazel) | 1.2.11 [🔗](https://downloads.sourceforge.net/libpng/zlib-1.2.11.tar.gz)
[`//lib/zstd`](https://github.com/attilaolah/wasm/blob/main/lib/zstd/BUILD.bazel) | 1.4.8 [🔗](https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz)


## Tools

| Build Label | Version |
|-------------|---------|
[`//tools/emscripten`](https://github.com/attilaolah/wasm/blob/main/tools/emscripten/BUILD.bazel) | 2.0.13 [🔗](https://github.com/emscripten-core/emsdk/archive/2.0.13.tar.gz)
[`//tools/llvm`](https://github.com/attilaolah/wasm/blob/main/tools/llvm/BUILD.bazel) | 11.0.1 [🔗](https://github.com/{name}/{name}-project/releases/download/{name}org-11.0.1/clang+{name}-11.0.1-x86_64-linux-gnu-ubuntu-20.10.tar.xz)


[Bazel]: https://bazel.build
[WebAssembly]: https://webassembly.org
