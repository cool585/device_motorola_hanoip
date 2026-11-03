/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/properties.h>
#include <libinit_dalvik_heap.h>
#include <libinit_utils.h>
#include <libinit_variant.h>

#include "vendor_init.h"

using android::base::GetProperty;

static const variant_info_t xt2147_info = {
    .hwc_value = "XT2147-1",

    .model = "moto g(40) fusion",
};

static const variant_info_t xt2135_info = {
    .hwc_value = "",

    .model = "moto g(60)",
};

static const std::vector<variant_info_t> variants = {
    xt2147_info,
    xt2135_info,
};

void vendor_load_properties() {
    search_variant(variants);
    set_dalvik_heap();

    std::string carrier = GetProperty("ro.boot.carrier", "");
    if (!carrier.empty()) {
        property_override("ro.carrier", carrier);
        property_override("ro.vendor.carrier", carrier);
    }

    std::string radio = GetProperty("ro.boot.radio", "");
    if (!radio.empty()) {
        property_override("ro.vendor.hw.radio", radio);
        property_override("ro.vendor.boot.radio", radio);
    }

    std::string device = GetProperty("ro.boot.device", "");
    if (!device.empty()) {
        property_override("ro.vendor.hw.device", device);
    }

    std::string dualsim = GetProperty("ro.boot.dualsim", "");
    if (!dualsim.empty()) {
        property_override("ro.vendor.hw.dualsim", dualsim);
        if (dualsim == "true") {
            property_override("persist.radio.multisim.config", "dsds");
            property_override("persist.vendor.radio.multisim.config", "dsds");
        }
    }

    std::string sku_variant = GetProperty("ro.boot.sku_variant", "");
    if (!sku_variant.empty()) {
        property_override("ro.vendor.hw.sku_variant", sku_variant);
    }
}
