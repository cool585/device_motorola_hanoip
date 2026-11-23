#
# Copyright (C) 2019-2024 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Inherit from the common SM6150 tree
$(call inherit-product, device/motorola/sm6150-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/hanoip/hanoip-vendor.mk)

# Properties
-include $(LOCAL_PATH)/properties.mk

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResHanoip \
    CarrierConfigResHanoip \
    NotchBarKiller \
    SettingsResHanoip \
    SystemUIResHanoip \
    TelephonyResHanoip

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Audio
# Hanoip keeps its own audio configuration files. audio_effects.xml and
# audio_policy_configuration.xml differ from / are provided by common.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Media
# media_codecs.xml and media_profiles_V1_0.xml differ from common, which skips
# them for hanoip. The remaining media configs come from sm6150-common.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Boot control
# Hanoip keeps its in-tree HIDL bootctrl + gpt-utils (virtual A/B partition
# list). These modules are renamed with a `-hanoip` suffix in bootctrl/ and
# gpt-utils/ to avoid colliding with the identical sm6150-common modules.
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti-hanoip \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl-qti-hanoip.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

$(call soong_config_set_bool,QTI_GPT_UTILS,USE_BSG_FRAMEWORK,false)

# Init
# Shared SM6150 init scripts come from common; the `hanoip` soong_config bool
# selects hanoip's diverged sources there. Only hanoip-only scripts are listed.
PRODUCT_PACKAGES += \
    init.hanoip.rc \
    init.mmi.overlay.rc \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh

$(call soong_config_set,libinit,vendor_init_lib,//$(LOCAL_PATH):init_hanoip)

# Fstab
# Hanoip uses a virtual A/B fstab; common's fstab copy is skipped for hanoip.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/double-tap.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/double-tap.idc \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-fpsensor.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpsensor.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/double-tap.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/double-tap.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpsensor.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpsensor.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.sm6150

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.nxp.mifare.xml

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml

# vndservicemanager
PRODUCT_PACKAGES += \
    vndservicemanager

# Misc
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.art_lowmem=true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
