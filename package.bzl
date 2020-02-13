load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("//fftw:package.bzl", download_fftw = "download_src")
load("//libjpeg_turbo:package.bzl", download_libjpeg_turbo = "download_src")
load("//liblzma:package.bzl", download_liblzma = "download_src")
load("//libpano13:package.bzl", download_libpano13 = "download_src")
load("//libpng:package.bzl", download_libpng = "download_src")
load("//libtiff:package.bzl", download_libtiff = "download_src")
load("//lz4:package.bzl", download_lz4 = "download_src")
load("//vigra:package.bzl", download_vigra = "download_src")
load("//zlib:package.bzl", download_zlib = "download_src")
load("//zstd:package.bzl", download_zstd = "download_src")

ALL_PUBLIC = """
filegroup(
    name = "all",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

def register_dependencies():
    """Set up dependencies of THIS workspace."""
    _github_repository(
        project = "rules_foreign_cc",
        owner = "bazelbuild",
        commit = "ed3db61a55c13da311d875460938c42ee8bbc2a5",
        shallow_since = "1574792034 +0100",
        pull_requests = {
            358: "cb5d6d647daeaed0e66685d148e00063217e7e2553cbc4c9ca714ac8ca4c49e4",
        },
    )

    http_archive(
        name = "cmake",
        urls = ["https://gitlab.kitware.com/cmake/cmake/-/archive/v3.16.4/cmake-v3.16.4.tar.bz2"],
        sha256 = "40e0dec6dc9e36820e001b8425aa4328a0b42f1915b14d68aee116e25c3d34df",
        strip_prefix = "cmake-v3.16.4",
        build_file_content = ALL_PUBLIC,
    )

    http_archive(
        name = "ninja",
        urls = ["https://github.com/ninja-build/ninja/archive/v1.10.0.zip"],
        sha256 = "bb489516d71f6e9c01ae65ab177041e025736bfcb042ac037be9e298abfcb056",
        strip_prefix = "ninja-1.10.0",
        build_file_content = ALL_PUBLIC,
    )

    _github_repository(
        project = "bazel-skylib",
        owner = "bazelbuild",
        commit = "e59b620b392a8ebbcf25879fc3fde52b4dc77535",  # 1.0.2
        shallow_since = "1570639401 -0400",
    )

def register_repositories():
    """Fetch and set up dependencies."""
    download_fftw()
    download_libjpeg_turbo()
    download_liblzma()
    download_libpano13()
    download_libpng()
    download_libtiff()
    download_lz4()
    download_vigra()
    download_zlib()
    download_zstd()

def _github_repository(project, owner, commit, shallow_since, pull_requests = None):
    """Wrapper around git_repository() for GitHub."""
    name = project.replace("-", "_")
    remote = "https://github.com/{}/{}".format(owner, project)

    patches, patch_args = [], []
    for pr, sha256 in (pull_requests or {}).items():
        pr_name = "{}_pr_{}".format(name, pr)
        patches.append("@{}//file:{}.patch".format(pr_name, pr))
        patch_args = ["-p1"]

        http_file(
            name = pr_name,
            downloaded_file_path = "{}.patch".format(pr),
            urls = ["{}/pull/{}.patch".format(remote, pr)],
            sha256 = sha256,
        )

    git_repository(
        name = name,
        remote = "https://github.com/{}/{}".format(owner, project),
        commit = commit,
        shallow_since = shallow_since,
        patches = patches,
        patch_args = patch_args,
    )
