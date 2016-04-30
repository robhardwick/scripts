#!/usr/bin/env bash
set -e

function cmd_missing() {
    ! hash $1 2>/dev/null
}

# Ensure "pv" and "mencoder" exist
if cmd_missing "pv" || cmd_missing "mencoder"; then
    printf 'Unable to find pv and/or mencoder. Try installing with:\n\tbrew install pv mplayer\n\n';
    exit 1;

# Check number of arguments
elif [ $# -lt 2 ]; then
    printf 'Usage: %s output.avi input1.avi input2.avi ...\n\n' `basename "${0}"`;
    exit 1;
fi

# Get output file
AVI_OUT="$1";
shift;

# Create temporary directory and avi file
AVI_TMP_DIR=`mktemp -d`
AVI_TMP_FILE="${AVI_TMP_DIR}/tmp.avi"

# Concatenate inputs into temporary file
printf 'Concatenating %d files...\n' $#
pv $@ > "$AVI_TMP_FILE"

# Use mencoder to re-index concatenated inputs into output
printf '\nFixing index and headers...\n'
mencoder -forceidx -oac copy -ovc copy "$AVI_TMP_FILE" -o "$AVI_OUT"

# Cleanup
rm -r "$AVI_TMP_DIR"
