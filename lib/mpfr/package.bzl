load("//:http_archive.bzl", "http_archive")
load("//toolchains/make:env_vars.bzl", "EMCONFIGURE")

VERSION = "4.1.0"

URL = "https://www.mpfr.org/mpfr-current/mpfr-{version}.tar.xz"

SHA256 = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"

def download_mpfr():
    http_archive(
        name = "lib_mpfr",
        version = VERSION,
        urls = [URL],
        sha256 = SHA256,
        strip_prefix = "mpfr-{version}",
        patch_cmds = EMCONFIGURE,
    )
