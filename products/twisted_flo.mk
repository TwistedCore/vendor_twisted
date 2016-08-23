# Inherit AOSP device configuration for flo
$(call inherit-product, device/asus/flo/full_flo.mk)

# Inherit common product files
$(call inherit-product, vendor/twisted/config/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := twisted_flo
PRODUCT_BRAND := google
PRODUCT_DEVICE := flo
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="razor" \
    BUILD_FINGERPRINT="google/razor/flo:5.1.1/LMY48M/2167285:user/release-keys" \
    PRIVATE_BUILD_DESC="razor-user 5.1.1 LMY48M 2167285 release-keys"
