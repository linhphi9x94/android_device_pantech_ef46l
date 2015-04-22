#
# Copyright (C) 2011 The Android Open-Source Project
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

include device/pantech/ef46l-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/pantech/ef46l/include

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.carrier=LGT-KOR user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 loglevel=0 androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := greenos_a830_defconfig
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_BOOTLOADER_BOARD_NAME := msm8960
TARGET_BOOTLOADER_NAME=ef46l
BOARD_USES_LEGACY_ALSA_AUDIO :=true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/ef46l/bluetooth

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"


TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB = device/pantech/ef46l/fstab.qcom
BOARD_RECOVERY_SWIPE := true


# Camera
#USE_CAMERA_STUB := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_USES_LEGACY_MMAP := true

-include vendor/pantech/ef46l/BoardConfigVendor.mk

# SELinux policies
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk


# Logging
TARGET_USES_LOGD := false

# Fonts
EXTENDED_FONT_FOOTPRINT := true
