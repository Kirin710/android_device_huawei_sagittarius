#
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/huawei/sagittarius

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Partition size 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1541256

# VNDK
BOARD_VNDK_VERSION := current
BOARD_VNDK_RUNTIME_DISABLE := true

# Properties
TARGET_SYSTEM_PROP := build/make/target/board/treble_system.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Bootloader, kernel and recovery are not part of generic AOSP image
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

# system.img is always ext4 with sparse option
# GSI also includes make_f2fs to support userdata parition in f2fs
# for some devices
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Generic AOSP image always requires separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
    ifneq ($(TARGET_BUILD_VARIANT),user)
      # Retain classes.dex in APK's for non-user builds
      DEX_PREOPT_DEFAULT := nostripping
    endif
  endif
endif

# Generic AOSP image does NOT support HWC1
TARGET_USES_HWC2 := true
# Set emulator framebuffer display device buffer count to 3
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# TODO(b/35790399): remove when b/35790399 is fixed.
BOARD_NAND_SPARE_SIZE := 0
BOARD_FLASH_BLOCK_SIZE := 512

# b/64700195: add minimum support for odm.img
# Currently odm.img can only be built by `make custom_images`.
# Adding /odm mount point under root directory.
BOARD_ROOT_EXTRA_FOLDERS += odm
