#!/usr/bin/env bash
set -e

# Update Homebrew itself
brew update

# Update *every* Homebrew package (except pinned)
brew upgrade --all

# Remove downloads, logs and old versions if requested. There's potential
# to really screw things up with this command so be careful! For example,
# to upgrade a major version of PostgreSQL using pg_upgrade you need
# the old binaries! (Yeah, I made that mistake before :)
if [ "$1" == "--clean" ]; then
    brew cleanup

# Otherwise, show what would be removed
else
    brew cleanup --dry-run
    printf '\nTo cleanup and free the space run:\n\t\e[0;1m%s --clean\e[0m\n' `basename "$0"`
fi

# Success message
printf '\n\e[0;32mSUCCESS\e[0m Your system is fully up to date! 🍾 🍷 🍹 🍸 🍶 🍺 🍻\n'
