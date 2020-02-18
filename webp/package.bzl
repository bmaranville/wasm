load("//:http_archive.bzl", "http_archive")

NAME = "webp"
VERSION = "1.1.0"

URL = "https://storage.googleapis.com/downloads.webmproject.org/releases/{name}/{lname}-{version}.tar.gz"

SHA256 = "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"

def download_src():
    http_archive(
        name = NAME,
        version = VERSION,
        urls = [URL],
        sha256 = SHA256,
        strip_prefix = "{lname}-{version}",
    )
