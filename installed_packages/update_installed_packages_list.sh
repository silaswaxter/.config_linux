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

native_packages_list_filename="pacman_packages_list"
foreign_packages_list_filename="foreign_packages_list"
ignore_packages_list_filename="ignore_packages_list"
native_packages_list_abs_path="${script_dir}/${native_packages_list_filename}"
foreign_packages_list_abs_path="${script_dir}/${foreign_packages_list_filename}"
ignore_packages_list_abs_path="${script_dir}/${ignore_packages_list_filename}"
staging_area_dir="/var/tmp"

#####
# ensure packages lists exist (commit will only fail if pre-commit updates file in staging area)
#####
exit_after_list_checks="false"
if [[ ! -f "${native_packages_list_abs_path}" ]]; then
    echo "Failed:    ${native_packages_list_abs_path} does not exist."

    touch "${native_packages_list_abs_path}"
    exit_after_list_checks="true"
fi
if [[ ! -f "${foreign_packages_list_abs_path}" ]]; then
    echo "Failed:    ${foreign_packages_list_abs_path} does not exist."

    touch "${foreign_packages_list_abs_path}"
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
# Update native and foreign (eg yay) package lists if new packages`
#####
# stage updated contents in temp file before touching files in git repo.
${script_dir}/fetch_installed_packages_list.sh -i "${ignore_packages_list_abs_path}" \
                                                -o "${staging_area_dir}/${native_packages_list_filename}"

${script_dir}/fetch_installed_packages_list.sh -i "${ignore_packages_list_abs_path}" \
                                                -f -o "${staging_area_dir}/${foreign_packages_list_filename}"

# if files differ, write staged file to actual file.
if [[ $(cmp "${staging_area_dir}/${native_packages_list_filename}" "${native_packages_list_abs_path}") ]]; then
    echo "Adding packages to ${native_packages_list_abs_path}:"
    echo "$(comm -3 ${staging_area_dir}/${native_packages_list_filename} ${native_packages_list_abs_path})"
    cp "${staging_area_dir}/${native_packages_list_filename}" "${native_packages_list_abs_path}"
fi

if [[ $(cmp "${staging_area_dir}/${foreign_packages_list_filename}" "${foreign_packages_list_abs_path}") ]]; then
    echo "Adding packages to ${foreign_packages_list_abs_path}:"
    echo "$(comm -3 ${staging_area_dir}/${foreign_packages_list_filename} ${foreign_packages_list_abs_path})"
   # cp "${staging_area_dir}/${foreign_packages_list_filename}" "${foreign_packages_list_abs_path}"
fi
