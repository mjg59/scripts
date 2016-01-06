#!/bin/bash

set -ex
VERSION="$1"
GS="gs://builds.release.core-os.net/stable/boards/amd64-usr/$VERSION"

cd "${2:-.}"

gsutil cp \
    "${GS}/${LOWER_BRAND}_production_update.bin.bz2" \
    "${GS}/${LOWER_BRAND}_production_update.bin.bz2.sig" \
    "${GS}/${LOWER_BRAND}_production_update.zip" \
    "${GS}/${LOWER_BRAND}_production_update.zip.sig" ./

gpg --verify "${LOWER_BRAND}_production_update.bin.bz2.sig"
gpg --verify "${LOWER_BRAND}_production_update.zip.sig"
