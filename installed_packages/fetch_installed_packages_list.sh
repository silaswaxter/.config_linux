#!/bin/bash
#INSERT HEADER

#####
# Definitions
#####
# Absolute path to this script,    (eg /home/silas/bin/foo.sh)
# Absolute path this script is in, (eg /home/silas/bin)
script_name=$(readlink -f "$0")
script_dir=$(dirname "${script_name}")

# default output is writing to stdout
output_file="/dev/stdout"
ignore_file=""

#####
# Global Parameters
#####
output_pacman="true"

#####
# Parse Passed Flags
#####
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "USAGE:    fetch_installed_packages_list.sh [options]"
            echo "ABOUT:    creates list of explicitly installed packages"
            echo "          ignores packages listed in '${ignore_file}'"
            echo "          list created at '${script_dir}'"
            echo " "
            echo "OPTIONS:"
            echo "-h, --help                Show help"
            echo "-f,                       Output only foreign packages (eg yay)"
            echo "-o OUTPUT_FILE,           Write the package list to OUTPUT_FILE"
            echo "-i IGNORE_FILE,           Ignore the packages listed in IGNORE_FILE"
            echo "                              - '#' at line start denotes a comment"
            echo "                              - each package name should be on its own line"
            echo " "
            exit 0
            ;;
        -f)
            output_pacman="false"
            shift
            ;;
        -o)
            output_file="${2}"
            shift 2
            ;;
        -i)
            ignore_file="${2}"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done

#####
# if ignore file passed, parse it into grep filter flags
#####
grep_flags_ignore_packages=''
if [[ -f "${ignore_file}" ]]; then
    # parse ignore file for packages
    ignore_packages=''
    while read -r line; do
        if [ "${line:0:1}" != "#" ]; then
            ignore_packages="${ignore_packages} ${line}"
        fi
    done < ${ignore_file}

    # get grep flags for filtering out ignore packages
    for package in ${ignore_packages}; do
        grep_flags_ignore_packages="${grep_flags_ignore_packages} -e ${package}"
    done
fi

#####
# get grep flags for filtering out foregin packages (for output of native-only packages)
#####
foregin_packages=$(pacman -Qqm)
for package in ${foregin_packages}; do
    grep_flags_foreign_packages="${grep_flags_foreign_packages} -e ${package}"
done

#####
# create the list
#####
if ${output_pacman} = "true"; then
    pacman -Qqe | grep -v ${grep_flags_foreign_packages} \
                          ${grep_flags_ignore_packages} > "${output_file}"
else
    pacman -Qqm | grep -v ${grep_flags_ignore_packages} > "${output_file}"
fi

exit 0
