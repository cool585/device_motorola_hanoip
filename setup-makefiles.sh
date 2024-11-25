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

function lib_to_package_fixup_vendor_variants() {
    if [ "$2" != "vendor" ]; then
        return 1
    fi
    case "$1" in
        vendor.qti.hardware.fm@1.0)
            echo "$1-vendor"
            ;;
        *)
            return 1
            ;;
    esac
}
function lib_to_package_fixup() {
    lib_to_package_fixup_clang_rt_ubsan_standalone "$1" ||
        lib_to_package_fixup_proto_3_9_1 "$1" ||
        lib_to_package_fixup_vendor_variants "$@"
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
