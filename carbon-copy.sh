#!/usr/bin/env bash
set -e

# Check args
if [ "$#" -lt 2 ]; then
    printf "Usage : ${0} <input file/devices> <output file/device> [<block size>]\n\n";
    exit;
fi

# Run
# 1. Assume input (arg 1) is a disk device node or similar (which requires root)
# 2. Assume output (arg 2) is writable by the current user
pv "${1}" | dd of="${2}" bs="${3:-64k}" conv="notrunc"

# Force any pending writes
sync
