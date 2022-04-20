#!/bin/bash
#ARGS:
#$1	name of directory containing dot files
#$2	location to link files to (ie home dir)
#$3	flags to pass to 'ln'

DOT_FILES_DIR=$(echo $1 | sed 's/\/$//')
echo "directory containing dot files = '${DOT_FILES_DIR}'"
echo "flags to be passed to linker = '${2}'"
echo "directory to create symbolic links = '${3}'"

ENTRIES_TO_IGNORE="$(basename ${0}) README.md asusg14_key_patches.txt"
ENTRIES_TO_IGNORE_LS_FLAGS=""
for entry in ${ENTRIES_TO_IGNORE}
do
    ENTRIES_TO_IGNORE_LS_FLAGS="${ENTRIES_TO_IGNORE_LS_FLAGS} --ignore ${entry}"
done

ENTRIES_TO_LINK=$(ls -A ${ENTRIES_TO_IGNORE_LS_FLAGS} ${DOT_FILES_DIR})

for entry in ${ENTRIES_TO_LINK}
do
	ln -s $3 "${DOT_FILES_DIR}/$entry" $2
done
