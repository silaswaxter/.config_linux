#!/bin/bash
#####
# Definitions
#####
# Absolute path to this script,    (eg /home/silas/bin/foo.sh)
SCRIPT_NAME=$(readlink -f "$0")
# Absolute path to the dir this script is in, (eg /home/silas/bin)
SCRIPT_DIR=$(dirname "${SCRIPT_NAME}")

SYMLINK_IGNORE_FILE="${SCRIPT_DIR}/symlink_ignore"

#####
# Parse Passed Flags
#####
IS_DISPLAY_HELP_MSG='false'
PASSED_OUTPUT_DIR=''

print_usage() {
    printf "%s\n"   "USAGE:      recursive_symlink_config_files.sh [OPTIONS]" \
        "ABOUT:      Creates symbolic links in the passed directory which point to the" \
        "            the config files in the directory this script is contained in." \
        "OPTIONS:" \
        "-h)                 Show this help message." \
        "-o output_dir)      Must use ABSOLUTE PATH.  Place the symbolic links at output_dir." \
        ""
    }


    while getopts 'ho:' flag; do
        case "${flag}" in
            h) IS_DISPLAY_HELP_MSG='true' ;;
            o) PASSED_OUTPUT_DIR="${OPTARG}" ;;
            *) print_usage
                exit 1 ;;
        esac
    done

    if [ "${IS_DISPLAY_HELP_MSG}" = "true" ]; then
        print_usage
    fi

# ensure output dir was passed
if [ "${PASSED_OUTPUT_DIR}" = '' ]; then
    printf "%s\n"   "You must pass an output directory."
    exit 1
fi

# ensure output dir is absolute.
if [ "${PASSED_OUTPUT_DIR:0:1}" != "/" ]; then
    printf "%s\n"   "output_dir must be an absolute path." \
        "output_dir passed:'${PASSED_OUTPUT_DIR}'"
            exit 1
fi

# strip trailing '/' on output dir if presetn
if [ "${PASSED_OUTPUT_DIR: -1}" == "/" ]; then
    PASSED_OUTPUT_DIR=${PASSED_OUTPUT_DIR::-1}
fi

# parse ignore file
ENTRIES_TO_IGNORE=''
while read -r line; do
    if [ "${line:0:1}" != "#" ]; then
        if [ "${line: -1}" == "/" ]; then
            ENTRIES_TO_IGNORE="${ENTRIES_TO_IGNORE} ${line::-1}"
        else
            ENTRIES_TO_IGNORE="${ENTRIES_TO_IGNORE} ${line}"
        fi
    fi
done < ${SYMLINK_IGNORE_FILE}

# append --ignore flag to ignored entries
LS_FLAG_ENTRIES_TO_IGNORE=''
for entry in ${ENTRIES_TO_IGNORE}; do
    LS_FLAG_ENTRIES_TO_IGNORE="${LS_FLAG_ENTRIES_TO_IGNORE} --ignore ${entry}"
done

# get entries to link
ENTRIES_TO_LINK=$(ls -A ${LS_FLAG_ENTRIES_TO_IGNORE} ${SCRIPT_DIR})

# confirm with user to create symlinks
printf "%s\n"   "symlinks will be placed at '${PASSED_OUTPUT_DIR}'" \
    "symlinks point to files at '${SCRIPT_DIR}'." \
    "linking:" \
    "${ENTRIES_TO_LINK}"
    read -p "Are you sure? [Yy/Nn]    " -n 1 -r
    printf "\n"
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        for entry in ${ENTRIES_TO_LINK}; do
            printf "created link at ${PASSED_OUTPUT_DIR}/${entry} \n"	
            ln -s "${SCRIPT_DIR}/${entry}" "${PASSED_OUTPUT_DIR}/${entry}"
        done
        printf "\n"
    fi

    exit 0
