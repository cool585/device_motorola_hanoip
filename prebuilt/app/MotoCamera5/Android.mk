LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := MotoCamera5
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT := false
LOCAL_OVERRIDES_PACKAGES := Camera2 Aperture

# The APK references Motorola and AndroidX libraries that are shipped as
# plain jars/XMLs instead of build modules (and some, like
# moto-active-stylus, are intentionally absent). The build-system
# <uses-library> check cannot resolve those module names, so skip it for
# this prebuilt. The libraries needed at runtime are installed below.
LOCAL_ENFORCE_USES_LIBRARIES := false

my_intermediates := $(call local-intermediates-dir)
LOCAL_PREBUILT_MODULE_FILE := $(my_intermediates)/$(LOCAL_MODULE).apk

MOTOCAMERA5_PARTS := \
    $(LOCAL_PATH)/MotoCamera5.apk.partaa \
    $(LOCAL_PATH)/MotoCamera5.apk.partab \
    $(LOCAL_PATH)/MotoCamera5.apk.partac

$(LOCAL_PREBUILT_MODULE_FILE): $(MOTOCAMERA5_PARTS)
	@mkdir -p $(dir $@)
	cat $(MOTOCAMERA5_PARTS) > $@

include $(BUILD_PREBUILT)
