#!/bin/bash
#
# This script executes all generator scripts in an input directory.
#
# Arguments:
#   1: Input directory path
#   2: Output directory path
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

set -e

INPUT_DIR=`realpath "${1}"`
OUTPUT_DIR=`realpath "${2}"`

[[ -d "${INPUT_DIR}" ]] || exit 1

# source include files
for d in `ls "include/"`; do
    source include/${d}
done

function generate {
    echo "Generate \"${1}\""
    
    mkdir -p "${OUTPUT_DIR}/${1}"
    (
        cd "${OUTPUT_DIR}/${1}"
        rsync -a --exclude='generate.sh' --exclude='LECTURE.md' --delete "${INPUT_DIR}/${1}/" "./"
        if [ -f "${INPUT_DIR}/${1}/generate.sh" ]; then
            . "${INPUT_DIR}/${1}/generate.sh" 2>&1 | sed 's/^/    /'
        fi
#        if command -v pandoc &> /dev/null && [ -f "${INPUT_DIR}/${1}/LECTURE.md" ]; then
#            pandoc -t beamer LECTURE.md -o test.pdf
#        fi
    )
    
    for d in `ls "${INPUT_DIR}/${1}"`; do
        if [ -d "${INPUT_DIR}/${1}/${d}" ]; then
            generate "${1}/${d}"
        fi
    done
}

generate ""
