#!/usr/bin/env bash

# Ensure "pv" exists
if ! hash pv 2>/dev/null; then
    printf 'Error: pv not found. Try installing it with:\n\tbrew install pv\n\n';
    exit 1;

# Ensure we are running as root
elif [ "$EUID" -ne 0 ]; then
    printf 'Error: Not running as root. Try using sudo, e.g.:\n\tsudo %s %s\n\n' `basename ${0}` "${@}";
    exit 1;

# Check args
elif [ "${#}" -lt 1 ]; then
    printf 'Usage: %s <disk> [<iterations>]\n\n' `basename "${0}"`;
    exit 1;

fi

# Terminal styling constants
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Required disk argument
DISK="${1}"
DISK_INFO=$(diskutil info "${DISK}")

# Ensure disk is valid
if [ "$?" -ne 0 ]; then
    printf 'Error: The disk %s%s%s is invalid!\n\n' "${BOLD}" "${DISK}" "${RESET}"
    printf 'For a list of valid disks run:\n\tdiskutil list\n'
    exit 1
fi

# Optional iterations argument (default 3)
ITERATIONS="${2:-3}"

# Ensure iterations is a valid integer
if [[ ! "${ITERATIONS}" =~ ^-?[0-9]+$ ]]; then
    printf 'Error: The iterations argument %s%s%s is not a valid integer!\n\n' "${BOLD}" "${ITERATIONS}" "${RESET}"
    exit 1
fi

# Get size of disk in bytes
DISK_SIZE=$(echo "${DISK_INFO}" | awk -v i=21 -v j=5 'FNR == i {print $j}' | cut -c 2-)

# Print summary
printf 'SECURE ERASE\n------------\n'
printf 'DISK:       %s\n' "${DISK}"
printf 'SIZE:       %d bytes\n' "${DISK_SIZE}"
printf 'ITERATIONS: %d\n\n' "${ITERATIONS}"
printf 'Warning: This command will %serase all data%s on %s!\n' "${BOLD}" "${RESET}" "${DISK}"

# Confirm secure erase
read -r -p "Are you sure you want to continue? [y/N] " response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    printf 'Aborted secure erase!\n'
    exit
else
    printf '\n'
fi

# Ensure disk isn't mounted
diskutil unmountDisk "${DISK}"

# Run secure erase process
for i in $(seq 1 "${ITERATIONS}"); do
    printf '\nRunning erase process %d/%d...\n' "${i}" "${ITERATIONS}"

    # Fill disk with random data
    # Note: We use /dev/urandom instead of /dev/random as we don't want it to block
    # and it's just as secure (see http://www.2uo.de/myths-about-urandom/)
    pv --size "${DISK_SIZE}" < /dev/urandom > "${DISK}"

    # Ensure any pending disk writes are completed
    sync
done

# Print success message
printf '\n\nSecure erase process complete!\n'
