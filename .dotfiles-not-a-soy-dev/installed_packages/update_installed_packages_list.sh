#!/bin/bash
################################################################################
# About:    A pre-commit script for my dotfiles git repo that takes a snapshot
#           of the installed packages on the arch linux system by recording them
#           in files. It calls `fetch_installed_packages_list.sh` to create
#           package lists for native and foreign (AUR) packages on this machine.
################################################################################

script_abs_path="$(readlink -f "$0")"
script_dir_abs_path="$(dirname "${script_abs_path}")"
fetch_package_list_script="${script_dir_abs_path}/fetch_installed_packages_list.sh"

native_list_filename="pacman_packages_list"
native_list_abs_path="${script_dir_abs_path}/${native_list_filename}"
foreign_list_filename="foreign_packages_list"
foreign_list_abs_path="${script_dir_abs_path}/${foreign_list_filename}"
ignore_list_filename="ignore_packages_list"
ignore_list_abs_path="${script_dir_abs_path}/${ignore_list_filename}"

staging_area_dir="/var/tmp"


# $1 := package_list_filename
# $2 := package_list_abs_path
update_package_list() {
    echo "Updating package list at '${2}'."
    echo "Changes to the list:"
    echo "|--------------|"
    echo "|ADDED  REMOVED|"
    echo "|--------------|"
    echo "$(comm --nocheck-order -3 ${staging_area_dir}/${1} ${2})"
    cp "${staging_area_dir}/${1}" "${2}"
    echo ""
}

# Ensure packages lists exist
#####
exit_after_list_checks="false"
if [[ ! -f "${native_list_abs_path}" ]]; then
    echo "Failed:  ${native_list_abs_path} does not exist."
    touch "${native_list_abs_path}"
    exit_after_list_checks="true"
fi
if [[ ! -f "${foreign_list_abs_path}" ]]; then
    echo "Failed:  ${foreign_list_abs_path} does not exist."
    touch "${foreign_list_abs_path}"
    exit_after_list_checks="true"
fi
if [[ "true" == "${exit_after_list_checks}" ]]; then
    echo "Created empty package list(s)..."
    echo "(You should probably commit these files.)"
    exit 1
fi

# Ensure package lists are updated
#####
# write to staging area so that lists can be compared
${fetch_package_list_script} -i "${ignore_list_abs_path}" \
    -o "${staging_area_dir}/${native_list_filename}"

${fetch_package_list_script} -i "${ignore_list_abs_path}" \
    -f -o "${staging_area_dir}/${foreign_list_filename}"

update_package_list ${native_list_filename} ${native_list_abs_path}

update_package_list ${foreign_list_filename} ${foreign_list_abs_path}
