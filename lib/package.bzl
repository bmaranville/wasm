load("//lib/ceres:package.bzl", "download_ceres")
load("//lib/eigen:package.bzl", "download_eigen")
load("//lib/fftw:package.bzl", "download_fftw")
load("//lib/gflags:package.bzl", "download_gflags")
load("//lib/gif:package.bzl", "download_gif")
load("//lib/glog:package.bzl", "download_glog")
load("//lib/gmp:package.bzl", "download_gmp")
load("//lib/hdf5:package.bzl", "download_hdf5")
load("//lib/jpeg_turbo:package.bzl", "download_jpeg_turbo")
load("//lib/lz4:package.bzl", "download_lz4")
load("//lib/lzma:package.bzl", "download_lzma")
load("//lib/mpfr:package.bzl", "download_mpfr")
load("//lib/pano13:package.bzl", "download_pano13")
load("//lib/png:package.bzl", "download_png")
load("//lib/readline:package.bzl", "download_readline")
load("//lib/suite_sparse:package.bzl", "download_suite_sparse")
load("//lib/tiff:package.bzl", "download_tiff")
load("//lib/vigra:package.bzl", "download_vigra")
load("//lib/webp:package.bzl", "download_webp")
load("//lib/z:package.bzl", "download_z")
load("//lib/zstd:package.bzl", "download_zstd")

def download_lib():
    """Download all library sources."""
    download_ceres()
    download_eigen()
    download_fftw()
    download_gflags()
    download_gif()
    download_glog()
    download_gmp()
    download_hdf5()
    download_jpeg_turbo()
    download_lz4()
    download_lzma()
    download_mpfr()
    download_pano13()
    download_png()
    download_readline()
    download_suite_sparse()
    download_tiff()
    download_vigra()
    download_webp()
    download_z()
    download_zstd()
