#!/usr/bin/env bash

###########
# Globals #
###########
BOLD=$(tput bold)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
HR=$(head -c 79 < /dev/zero | tr '\0' '-')
PROG=$(basename "${BASH_SOURCE[0]}")

#####################################
# Print warning if exiv2 is missing #
#####################################
function exiv2_error {
    cat <<EOF
${BOLD}${RED}[ERROR]${RESET} exiv2 not found! Please install and try again.
${HR}

If you're using Homebrew you can fix this error by running:
    brew install exiv2

For more information on Homebrew see:
    http://brew.sh/

EOF
}

######################################
# Print script info and instructions #
######################################
function usage {
    cat <<EOF
${PROG} - Remove all metadata from the supplied image files
${HR}

This script just wraps the exiv2 program and sets the appropriate options to
remove all metadata from the specified images that could contain PII
(Personally Identifiable Information).

For technical details see the following:
* exiv2 - Image metadata library and tools
    http://www.exiv2.org/
* Exif - Exchangeable image file format
    http://www.cipa.jp/std/documents/e/DC-008-2012_E.pdf
* IPTC / XMP - Set of metadata attributes that can be applied to various media
    https://www.iptc.org/std/photometadata/specification/IPTC-PhotoMetadata
* Comments or other textual fields
    https://www.w3.org/Graphics/JPEG/itu-t81.pdf#page=47 (see B.2.4.5)
    https://www.w3.org/TR/PNG-Chunks.html#C.tEXt
    http://qalle.net/gif89a.php#commentextension

Usage
${HR}
${PROG} file.jpg ...

EOF
}

#######################
# Anonymise arguments #
#######################
function anonymise {
    for image in "$1"; do
        exiv2 -v rm "$image";
    done
}

###################
# Execute Program #
###################

# Ensure exiv2 exists
if ! hash exiv22 2>/dev/null; then
    exiv2_error;

# Print help if requested or if no arguments have been given
elif [[ $1 = '-h' || $1 = '--help' || (( $# < 1 )) ]]; then
    usage; 

# Anonymise arguments
else
    anonymise "$@";
fi
