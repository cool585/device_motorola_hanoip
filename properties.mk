#
# Properties for hanoip (delta over sm6150-common)
#

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.calfile0=/vendor/etc/acdbdata/Bluetooth_cal.acdb \
    persist.vendor.audio.calfile1=/vendor/etc/acdbdata/General_cal.acdb \
    persist.vendor.audio.calfile2=/vendor/etc/acdbdata/Global_cal.acdb \
    persist.vendor.audio.calfile3=/vendor/etc/acdbdata/Handset_cal.acdb \
    persist.vendor.audio.calfile4=/vendor/etc/acdbdata/Hdmi_cal.acdb \
    persist.vendor.audio.calfile5=/vendor/etc/acdbdata/Headset_cal.acdb \
    persist.vendor.audio.calfile6=/vendor/etc/acdbdata/Speaker_cal.acdb \
    persist.vendor.audio.calfile7=/vendor/etc/acdbdata/Codec_cal.acdb \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicecomm=true \
    vendor.audio.offload.buffer.size.kb=256

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.physical.num=5 \
    persist.vendor.camera.privapp.list=org.lineageos.aperture \
    vendor.camera.aux.packagelist=org.lineageos.aperture

PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM7150

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=::v2

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.idle_time=0

PRODUCT_PRODUCT_PROPERTIES += \
    ro.qcom.hdr.config=/system/vendor/etc/hdr_tm_config.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE \
    vendor.build.customerid=retail \
    ro.vendor.mot.factory=false

PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.start_ota_daemon=1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.sensors.mot_ltv=true \
    persist.vendor.sensors.hal_trigger_ssr=true \
    persist.vendor.sensors.odl.adsp=true

PRODUCT_PRODUCT_PROPERTIES += \
    persist.sysui.disableBlur=false

