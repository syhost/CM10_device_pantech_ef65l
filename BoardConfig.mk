# Copyright (C) 2009 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/pantech/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/pantech/ef65l/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := ef65l

# Assert
TARGET_OTA_ASSERT_DEVICE := a820l,ef65l,IM-A820L

# Kernel
BOARD_KERNEL_CMDLINE        := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.carrier=LGT-KOR loglevel=0
BOARD_KERNEL_BASE           := 0x40200000
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000
BOARD_KERNEL_PAGESIZE       := 2048

TARGET_KERNEL_SOURCE        := kernel/pantech/ef65l_jb_kernel_65_2
TARGET_KERNEL_CONFIG        := msm8660-perf-EF65L_TP20_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
# Define Prebuilt kernel locations
#TARGET_PREBUILT_KERNEL      := device/pantech/ef65l/prebuilt/kernel


# Recovery
BOARD_USES_MMCUTILS             := true
BOARD_HAS_NO_MISC_PARTITION     := true
BOARD_HAS_NO_SELECT_BUTTON      := true
BOARD_HAS_LARGE_FILESYSTEM      := true
BOARD_USE_CUSTOM_RECOVERY_FONT  := \"roboto_15x24.h\"

TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE             := 131072

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_VOLD_MAX_PARTITIONS := 26

# Disable initlogo
TARGET_NO_INITLOGO := true

#sdcard device
BOARD_SDCARD_DEVICE_PRIMARY     := /dev/block/mmcblk0p26
BOARD_SDCARD_DEVICE_SECONDARY   := /dev/block/mmcblk1p1
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2

