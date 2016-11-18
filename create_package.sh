#!/bin/sh
set -e

# Steps:
# 1. Create st tarball
# 2. Execute PKGBUILD script
# 3. Cleanup everything

# Create the st tarball
make dist

# Execute PKGBUILD script
export PKGDEST="$(pwd)/archpkg"
if test ! -d ${PKGDEST};
then
	mkdir -p ${PKGDEST}
fi
updpkgsums && makepkg -cf

# clean binary, objects and archive
make clean
