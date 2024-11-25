#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=hanoip
VENDOR=motorola

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

export TARGET_ENABLE_CHECKELF=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

function vendor_imports() {
    cat << EOF >> "$1"
		"device/motorola/hanoip",
		"hardware/qcom-caf/sm8150",
		"hardware/qcom-caf/wlan",
		"vendor/qcom/opensource/commonsys/display",
		"vendor/qcom/opensource/dataservices",
		"vendor/qcom/opensource/display",
EOF
}

# Initialize the helper for device
source "${MY_DIR}/../../${VENDOR}/${DEVICE}/setup-makefiles.sh"
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}"

# Warning headers and guards
write_headers

# The standard device blobs
write_makefiles "${MY_DIR}/proprietary-files.txt"

# Finish
write_footers
