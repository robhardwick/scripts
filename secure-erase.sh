#!/usr/bin/env bash

# Check args
if [ "${#}" -ne 1 ]; then
    printf 'Usage: %s <disk>\n\n' `basename "${0}"`;
    exit 1;

fi

# Terminal styling constants
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Erase level constant (3-pass secure erase)
ERASE_LEVEL=4

# Required disk argument
DISK="${1}"

printf 'Warning: This command will %serase all data%s on %s!\n' "${BOLD}" "${RESET}" "${DISK}"

# Confirm secure erase
read -r -p "Are you sure you want to continue? [y/N] " response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    printf 'Aborted secure erase!\n\n'
    exit
else
    printf '\n'
fi

# Perform secure erase
diskutil secureErase ${ERASE_LEVEL} "${DISK}"

# Print success message
printf '\n\nSecure erase process complete!\n'
