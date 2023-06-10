#
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/huawei/sagittarius

# Those overrides are here because Huawei's init read properties
# from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
# So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.fingerprint=$(BUILD_FINGERPRINT) \
    ro.build.version.release=$(PLATFORM_VERSION)

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Ramdisk
PRODUCT_PACKAGES += \
    init.kirin710.rc \
    fstab.kirin710 \
    ueventd.qcom.rc \

# VNDK
PRODUCT_PACKAGES += \
    vndk-sp

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
