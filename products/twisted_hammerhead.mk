# Inherit AOSP device configuration for hammerhead
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Inherit common product files
$(call inherit-product, vendor/twisted/config/common.mk)

# Override AOSP build properties
PRODUCT_NAME := twisted_hammerhead
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="hammerhead" BUILD_FINGERPRINT="google/hammerhead/hammerhead:6.0.1/MMB29S/2489379:user/release-keys" PRIVATE_BUILD_DESC="hammerhead-user 6.0.1 MMB29S 2489379 release-keys"
