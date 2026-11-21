#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

MOTOCAMERA4_PATH := device/motorola/hanoip/motocamera4

# SOONG NAMESPACE
PRODUCT_SOONG_NAMESPACES += \
    $(MOTOCAMERA4_PATH)

# Packages
PRODUCT_PACKAGES += \
    MotCamera4-hanoip \
    MotCamera3AI-hanoip \
    MotoPhotoEditor \
    MotoSignatureApp \
    MotoSignature2App \
    MotorolaSettingsProvider

# Framework and shared libraries
PRODUCT_PACKAGES += \
    com.motorola.frameworks.core.addon \
    moto-checkin \
    moto-core_services \
    moto-settings \
    com.motorola.motosignature \
    com.motorola.android.dropboxhelper \
    com.motorola.androidx.camera.extensions \
    com.motorola.camera.extensions \
    libmcf_native_window_helper.motocamera \
    libenginepostproc.moto \
    public.libraries-moto \
    public.libraries-motocamera

# Permissions, sysconfig, and inits
PRODUCT_PACKAGES += \
    com.motorola.camera3.hanoip \
    com.motorola.camera3 \
    com.motorola.camera3.content.ai \
    com.motorola.camera3.lens \
    com.motorola.photoeditor \
    com.motorola.maya \
    privapp-permissions-com.motorola.camera3 \
    deviceowner-configuration-com.motorola.camera3 \
    hiddenapi-whitelist-com.motorola.camera3 \
    initial-package-stopped-states-com.motorola.camera3 \
    init.motcamera3.lens \
    init.moto_package_name.motcamera3
