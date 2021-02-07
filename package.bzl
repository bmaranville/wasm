"""Repository rules for downloading all dependencies.

The two functions should be called in the WORKSPACE file this order:

register_dependencies()
register_repositories()
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("//lib:package.bzl", "download_lib")
load("//tools:package.bzl", "download_tools")
load(":http_archive.bzl", "http_archive")

def register_dependencies():
    """Set up dependencies of THIS workspace."""
    _github_repository(
        project = "rules_foreign_cc",
        owner = "bazelbuild",
        commit = "466c32c70f6262f43eac06ad5e9dc2cbecbba228",
        shallow_since = "1612531747 +0000",
        pull_requests = {
            481: "ee6536a9cec2844197b2cf4d9476a7be3bb43d99c3ec2231b5833bb17fe5f909",
        },
    )

    http_archive(
        name = "build_bazel_rules_nodejs",
        version = "3.0.0",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/{version}/rules_nodejs-{version}.tar.gz"],
        sha256 = "6142e9586162b179fdd570a55e50d1332e7d9c030efd853453438d607569721d",
        build_file_content = None,
    )

    http_archive(
        name = "io_bazel_rules_go",
        version = "0.25.1",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v{version}/rules_go-v{version}.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v{version}/rules_go-v{version}.tar.gz",
        ],
        sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
        build_file_content = None,
    )

    http_archive(
        name = "bazel_gazelle",
        version = "0.22.3",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v{version}/bazel-gazelle-v{version}.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v{version}/bazel-gazelle-v{version}.tar.gz",
        ],
        sha256 = "222e49f034ca7a1d1231422cdb67066b885819885c356673cb1f72f748a3c9d4",
        build_file_content = None,
    )

    http_archive(
        name = "platforms",
        version = "0.0.2",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/{name}/releases/download/{version}/{name}-{version}.tar.gz",
            "https://github.com/bazelbuild/{name}/releases/download/{version}/{name}-{version}.tar.gz",
        ],
        sha256 = "48a2d8d343863989c232843e01afc8a986eb8738766bfd8611420a7db8f6f0c3",
        build_file_content = None,
    )

    http_archive(
        name = "bazel-skylib",
        version = "1.0.3",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/{name}/releases/download/{version}/{name}-{version}.tar.gz",
            "https://github.com/bazelbuild/{name}/releases/download/{version}/{name}-{version}.tar.gz",
        ],
        sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
        build_file_content = None,
    )

def register_repositories():
    """Fetch and set up dependencies."""
    download_lib()
    download_tools()

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
