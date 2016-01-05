# Inherit AOSP device configuration for mako
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

# Inherit common product files
$(call inherit-product, vendor/twisted/config/common.mk)

# Override AOSP build properties
PRODUCT_NAME := twisted_shamu
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=shamu BUILD_FINGERPRINT="google/shamu/shamu:6.0.1/MMB29S/2489379:user/release-keys" PRIVATE_BUILD_DESC="shamu-user 6.0.1 MMB29S 2489379 release-keys"


