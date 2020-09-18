# To be called from the Docker container.
# DO NOT RUN outside of the Docker container.

# Yes I know this is dangerous.
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Find the key ID of bazel-dev:
key_id=$(
  apt-key list \
    | grep -B1 bazel-dev@googlegroups.com \
    | head -1 \
    | tr -d ' '
)

# Now get the keys for bazel-dev:
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com "${key_id}" 2>&1

# Finally do a system upgrade.
apt-get update
apt-get --yes dist-upgrade 2>&1

# Install cmake and friends.
# Also, Emscripten requires Python 3.5+.
apt-get --yes install build-essential python3 2>&1

# Self-destruct.
rm /etc/update.sh
