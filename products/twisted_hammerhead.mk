# Inherit AOSP device configuration for hammerhead
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Inherit common product files
$(call inherit-product, vendor/twisted/config/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := twisted_hammerhead
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hammerhead BUILD_FINGERPRINT=google/hammerhead/hammerhead:5.1.1/LMY48M/2167285:user/release-keys PRIVATE_BUILD_DESC="hammerhead-user 5.1.1 LMY48M 2167285 release-keys"
