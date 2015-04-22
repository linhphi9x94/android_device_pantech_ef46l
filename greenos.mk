## Specify phone tech before including full_phone
$(call inherit-product, vendor/greenos/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/greenos/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/greenos/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef46l/ef46l.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ef46l
PRODUCT_NAME := greenos_ef46l
PRODUCT_BRAND := pantech
PRODUCT_MODEL := Vega Racer 2
PRODUCT_MANUFACTURER := PANTECH

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Enable Torch
PRODUCT_PACKAGES += Torch
