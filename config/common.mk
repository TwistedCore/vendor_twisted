PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Extra Optional packages
PRODUCT_PACKAGES += \

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/twisted/overlay/common \
    vendor/twisted/overlay/dictionaries

# Versioning System
PRODUCT_VERSION_MAJOR = 7
PRODUCT_VERSION_MINOR = 0.1
PRODUCT_VERSION_MAINTENANCE = 0.1
TWISTED_BUILD_TYPE =Alpha

TWISTED_POSTFIX := $(shell date +"%Y%m%d-%H%M")
TWISTED_DEVICE_SHORT := $(TWISTED_DEVICE)
TWISTED_DEVICE_SHORT := $(subst twisted_,,$(TWISTED_DEVICE_SHORT))

# Set all versions
TWISTED_VERSION := $(TARGET_PRODUCT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TWISTED_BUILD_TYPE)-$(PRODUCT_VERSION_MAINTENANCE)-$(TWISTED_POSTFIX)
TWISTED_MOD_VERSION := screwd-$(TWISTED_DEVICE_SHORT)-$(SCREWD_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ota.version=$(PRODUCT_VERSION_MAJOR)-$(TWISTED_POSTFIX) \
    ro.twisted.version=$(TWISTED_VERSION) \
    ro.modversion=$(TWISTED_MOD_VERSION) \
    ro.twisted.buildtype=$(TWISTED_BUILD_TYPE)

