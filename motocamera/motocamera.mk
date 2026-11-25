# Moto Camera 4 (hanoip) + Moto Camera 3 AI + Moto Photo Editor
# Prebuilts sourced from cam/ module payload (MotCamera4 for hanoip, A17).

PRODUCT_PACKAGES += \
    MotCamera4-hanoip \
    MotCamera3AI-hanoip \
    MotoPhotoEditor \
    MotoSignatureApp \
    MotoSignature2App \
    com.motorola.motosignature.jar \
    com.motorola.frameworks.core.addon.jar \
    moto-checkin.jar \
    moto-core_services.jar \
    com.motorola.androidx.camera.extensions.jar \
    libenginepostproc.moto \
    libmcf_native_window_helper.motocamera \
    moto-settings \
    motsettings

PRODUCT_PRODUCT_PROPERTIES += \
    ro.camera.package_name=com.motorola.camera3 \
    ro.com.google.lens.oem_camera_package=com.motorola.camera3

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.privapp.list=com.motorola.camera3 \
    vendor.camera.aux.packagelist=com.motorola.camera3

# Hidden API/sysconfig for Moto Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/product/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml \
    $(LOCAL_PATH)/product/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml
