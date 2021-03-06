#!/bin/bash
set -eux

# Test what add_new_fpc_version.sh did.
# Pass the same arguments.

FPC_VERSION="$1"
LAZARUS_VERSION="$2"
shift 2

# Install "file" utility
apt-get update
apt-get --no-install-recommends -y install file

/usr/local/tests/bin/test_fpc_version_native.sh ${FPC_VERSION}
/usr/local/tests/bin/test_fpc_version_cross.sh ${FPC_VERSION} win32 i386
/usr/local/tests/bin/test_fpc_version_cross.sh ${FPC_VERSION} win64 x86_64
/usr/local/tests/bin/test_fpc_version_lazarus.sh ${FPC_VERSION} ${LAZARUS_VERSION}
