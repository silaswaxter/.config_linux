#!/bin/bash
##########
# DESC:		This script serves as a pre-commit script for my config_files_linux git repo;  it uses
#           `fetch_installed_packages_list.sh` to create package lists for foreign and native
#           packages on this machine.
# AUTHOR:   Silas Waxter
# DATE:		05/05/2022
##########

#####
# Definitions
#####
# absolute path of this script
# absolute path of this script's directory
script_name="$(readlink -f "$0")"
script_dir="$(dirname "${script_name}")"

native_packages_list_file="${script_dir}/pacman_packages_list"
foreign_packages_list_file="${script_dir}/foreign_packages_list"
ignore_packages_list_file="${script_dir}/ignore_packages_list"

#####
# ensure packages lists exist (commit will only fail if pre-commit updates file in staging area)
#####
exit_after_list_checks="false"
if [[ ! -f "${native_packages_list_file}" ]]; then
    echo "Failed:    ${native_packages_list_file} does not exist."

    touch "${native_packages_list_file}"
    exit_after_list_checks="true"
fi
if [[ ! -f "${foreign_packages_list_file}" ]]; then
    echo "Failed:    ${foreign_packages_list_file} does not exist."

    touch "${foreign_packages_list_file}"
    exit_after_list_checks="true"
fi
if [[ "true" == "${exit_after_list_checks}" ]]; then
    echo "-----"
    echo "Created empty package list(s)."
    echo "-----"
    echo "Remember:    Add package list(s) to staging area."
    exit 1
fi

#####
# Update native and foreign (eg yay) package lists
#####
${script_dir}/fetch_installed_packages_list.sh -i "${ignore_packages_list_file}" \
                                                -o "${native_packages_list_file}"

${script_dir}/fetch_installed_packages_list.sh -i "${ignore_packages_list_file}" \
                                                -f -o "${foreign_packages_list_file}"
