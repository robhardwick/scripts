#!/usr/bin/env bash
set -e

# Ensure "pv" exists
if ! hash pv 2>/dev/null; then
    printf "pv not found. Try installing it with:\n\tbrew install pv\n\n";

# Check args
elif [ "${#}" -lt 2 ]; then
    PROG=$(basename "${0}")
    printf "Usage: ${PROG} <input device> <output file> [<block size>]\n\n";

# Run
else
    # 1. Assume input (arg 1) is a disk device node or similar (which requires root)
    # 2. Assume output (arg 2) is writable by the current user
    sudo pv "${1}" | dd of="${2}" bs="${3:-64k}" conv="notrunc"

    # Force any pending writes
    sync
fi
