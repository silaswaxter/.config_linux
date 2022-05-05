#!/bin/bash
#INSERT HEADER

#####
# Definitions
#####
# Absolute path to this script,    (eg /home/silas/bin/foo.sh)
SCRIPT_NAME=$(readlink -f "$0")
# Absolute path this script is in, (eg /home/silas/bin)
SCRIPT_DIR=$(dirname "${SCRIPT_NAME}")

#####
# Definitions
#####
OUTPUT_FILENAME="${SCRIPT_DIR}/pacman_pkglist.lst"
IGNORE_FILENAME="${SCRIPT_DIR}/ignored_packages.lst"

OUTPUT_PACMAN="true"

#####
# Parse Passed Flags
#####
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "USAGE:    fetch_installed_packages_list.sh [options]"
            echo "ABOUT:    creates list of explicitly installed packages"
            echo "          ignores packages listed in '${IGNORE_FILENAME}'"
            echo "          list created at '${SCRIPT_DIR}'"
            echo " "
            echo "OPTIONS:"
            echo "-h, --help                Show help"
            echo "-f,                       (INCLUDES yay).  Only foreign packages."
            echo "-p, (DEFAULT)             (EXCLUDES yay).  Only non-foreign packages"
            echo " "
            exit 0
            ;;
        -f)
            OUTPUT_PACMAN="false"
            OUTPUT_FILENAME="${SCRIPT_DIR}/foreign_pkglist.lst"
            shift
            ;;
        -p)
            shift
            ;;
        *)
            break
            ;;
    esac
done

if ${OUTPUT_PACMAN} = "true"; then
    pacman -Qqe | grep -v "$(pacman -Qqm) $(cat ${IGNORE_FILENAME})" > ${OUTPUT_FILENAME}
else
    pacman -Qqm | grep -v "$(cat ${IGNORE_FILENAME})" > ${OUTPUT_FILENAME}
fi

exit 0
