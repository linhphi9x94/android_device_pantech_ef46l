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

# This file includes all definitions that apply to ALL geefhd devices, and
# are also specific to geefhd devices
#
# Everything in this directory will become public

$(call inherit-product, device/pantech/ef46l-common/ef46l.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += ko_KR xhdpi

PRODUCT_PACKAGES += \
	lights.qcom \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat 

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald-qcom.conf:system/etc/thermald.conf

#RamDisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/initlogo.rle:root/initlogo.rle888 \
	$(LOCAL_PATH)/init.qcom.rc:root/init.qcom.rc \
        $(LOCAL_PATH)/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/fstab.qcom:root/fstab.qcom \
	$(LOCAL_PATH)/ueventd.qcom.rc:root/ueventd.qcom.rc

# Recovery
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

#Keylayout
PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/keypad_8064.kl:system/usr/keylayout/gk-keypad-8064.kl

#LCD Destiny
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_PACKAGES += \
	hwaddrs \
    hci_qcomm_init 

PRODUCT_PACKAGES += \
	brcm_patchram_plus

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/misc/bdaddr

PRODUCT_COPT_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=9 \
	telephony.lteOnGsmDevice=1 \
        ro.hwui.text_cache_width=2048 \
        ro.qualcomm.cabl=1 \
        persist.gps.qmienabled=true \
        ro.vendor.extension_library=/system/lib/libqc-opt.so \
        ro.use_data_netmgrd=true \
        persist.data.netmgrd.qos.enable=false 

# WiFi
PRODUCT_PACKAGES += \
	libwfcu \
	wcnss_service \
	conn_init 

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
