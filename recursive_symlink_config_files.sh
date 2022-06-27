#!/bin/bash
#####
# Definitions
#####
# Absolute path to this script,    (eg /home/silas/bin/foo.sh)
# Absolute path to the dir this script is in, (eg /home/silas/bin)
script_name=$(readlink -f "$0")
script_dir=$(dirname "${script_name}")

symlink_ignore_file="${script_dir}/symlink_ignore_hidden_files"

#####
# Parse Passed Flags
#####
is_display_help_message='false'
output_dir=''

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
            h) is_display_help_message='true' ;;
            o) output_dir="${OPTARG}" ;;
            *) print_usage
                exit 1 ;;
        esac
    done

    if [ "${is_display_help_message}" = "true" ]; then
        print_usage
    fi

# ensure output dir was passed
if [ "${output_dir}" = '' ]; then
    printf "%s\n"   "You must pass an output directory."
    exit 1
fi

# ensure output dir is absolute.
if [ "${output_dir:0:1}" != "/" ]; then
    printf "%s\n"   "output_dir must be an absolute path." \
        "output_dir passed:'${output_dir}'"
            exit 1
fi

# strip trailing '/' on output dir if presetn
if [ "${output_dir: -1}" == "/" ]; then
    output_dir=${output_dir::-1}
fi

# parse ignore file
entries_to_ignore=''
while read -r line; do
    if [ "${line:0:1}" != "#" ]; then
        if [ "${line: -1}" == "/" ]; then
            entries_to_ignore="${entries_to_ignore} ${line::-1}"
        else
            entries_to_ignore="${entries_to_ignore} ${line}"
        fi
    fi
done < ${symlink_ignore_file}

# add non-hidden files to ignored_entries
non_hidden_files=$(ls "${script_dir}")
for entry in "${non_hidden_files}"; do 
    entries_to_ignore="${entries_to_ignore} ${entry}"
done

# append --ignore flag to ignored entries
ls_flag_entries_to_ignore=''
for entry in ${entries_to_ignore}; do
    ls_flag_entries_to_ignore="${ls_flag_entries_to_ignore} --ignore ${entry}"
done

# get entries to link
entries_to_link=$(ls -A ${ls_flag_entries_to_ignore} ${script_dir})

# confirm with user to create symlinks
printf "%s\n"   "symlinks will be placed at '${output_dir}'" \
    "symlinks point to files at '${script_dir}'." \
    "linking:" \
    "${entries_to_link}"
    read -p "Are you sure? [Yy/Nn]    " -n 1 -r
    printf "\n"
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        for entry in ${entries_to_link}; do
            printf "created link at ${output_dir}/${entry} \n"	
            ln -s "${script_dir}/${entry}" "${output_dir}/${entry}"
        done
        printf "\n"
    fi

exit 0
