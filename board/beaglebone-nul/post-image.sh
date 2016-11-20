#!/bin/sh

board_home=$(dirname "$0")

# copy the uEnv.txt to the output/images directory
cp "${board_home}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"

genimage_cfg="${board_home}/genimage.cfg"
genimage_tmp="${BUILD_DIR}/genimage.tmp"

rm -rf "${genimage_tmp}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${genimage_tmp}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${genimage_cfg}"
