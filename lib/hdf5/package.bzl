load("//:http_archive.bzl", "http_archive")

VERSION = "1.12.0"

URL = "https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_{version_}/source/hdf5-{version}.tar.gz"

SHA256 = "a62dcb276658cb78e6795dd29bf926ed7a9bc4edf6e77025cd2c689a8f97c17a"

def download_hdf5():
    http_archive(
        name = "lib_hdf5",
        version = VERSION,
        urls = [URL],
        sha256 = SHA256,
        strip_prefix = "hdf5-{version}",
    )
