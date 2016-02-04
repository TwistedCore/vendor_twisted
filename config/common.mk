# Brand
PRODUCT_BRAND ?= twisted

# Local path for prebuilts
LOCAL_PATH:= vendor/twisted/prebuilts/common/system

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.build.selinux=1 \
    ro.adb.secure=1

# Nova Launcher
#PRODUCT_COPY_FILES += \
#    vendor/twisted/prebuilt/common/app/Nova.apk:system/app/Nova/Nova.apk \
#    vendor/twisted/prebuilt/common/lib/libgif.so:system/app/Nova/lib/arm/libgif.so

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/twisted/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk

# Camera Effects
ifneq ($(filter twisted_flounder twisted_hammerhead twisted_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/twisted/prebuilt/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/twisted/prebuilt/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Latin IME lib - gesture typing
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Extra packages
PRODUCT_PACKAGES += \
    LockClock \
    Launcher3 \
    AdAway \
    SlimOTA \
    Terminal \
    KernelAdiutor \
    LayersManager \
    LMT \
    Gallery2

# APN list
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/bin/sysinit:system/bin/sysinit
    
# twisted-specific init file
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/bin/init.twisted.rc:root/init.twisted.rc
    
# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/addon.d/50-twisted.sh:system/addon.d/50-twisted.sh \
    vendor/twisted/prebuilt/addon.d/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/twisted/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/twisted/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/twisted/prebuilt/etc/backup.conf:system/etc/backup.conf

# Bootanimation support
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Versioning System
PRODUCT_VERSION_MAJOR = 6.0.1
PRODUCT_VERSION_MINOR = build
PRODUCT_VERSION_MAINTENANCE = 3.6
ifdef TWISTED_BUILD_EXTRA
    TWISTED_POSTFIX := -$(TWISTED_BUILD_EXTRA)
endif
ifndef TWISTED_BUILD_TYPE
    TWISTED_BUILD_TYPE := build
    TWISTED_POSTFIX := $(shell date +"%Y%m%d")
endif

# Set all versions
TWISTED_VERSION := Twisted-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
TWISTED_MOD_VERSION := Twisted-$(TWISTED_BUILD)-$(PRODUCT_VERSION_MAJOR)-$(TWISTED_BUILD_TYPE)-$(PRODUCT_VERSION_MAINTENANCE)-$(TWISTED_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    twisted.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.twisted.version=$(TWISTED_VERSION) \
    ro.modversion=$(TWISTED_MOD_VERSION) \
    ro.twisted.buildtype=$(TWISTED_BUILD_TYPE)

FINISHER_SCRIPT := vendor/twisted/tools/finisher
SQUISHER_SCRIPT := vendor/twisted/tools/squisher
CHANGELOG_SCRIPT := vendor/twisted/tools/changelog.sh

