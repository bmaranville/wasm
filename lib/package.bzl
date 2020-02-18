load("//lib/fftw:package.bzl", "download_fftw")
load("//lib/gif:package.bzl", "download_gif")
load("//lib/lz4:package.bzl", "download_lz4")
load("//lib/lzma:package.bzl", "download_lzma")
load("//lib/pano13:package.bzl", "download_pano13")
load("//lib/png:package.bzl", "download_png")
load("//lib/tiff:package.bzl", "download_tiff")
load("//lib/vigra:package.bzl", "download_vigra")
load("//lib/webp:package.bzl", "download_webp")
load("//lib/z:package.bzl", "download_z")
load("//lib/zstd:package.bzl", "download_zstd")

def download_lib():
    """Download all library sources."""
    download_fftw()
    download_gif()
    download_lz4()
    download_lzma()
    download_pano13()
    download_png()
    download_tiff()
    download_vigra()
    download_webp()
    download_z()
    download_zstd()
