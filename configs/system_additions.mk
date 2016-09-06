# Copyright (C) 2016 The Pure Nexus Project
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

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/bin/sysinit:system/bin/sysinit

# Twisted Core-specific init file
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/etc/init.twisted.rc:root/init.twisted.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/twisted/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/twisted/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh \

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1


# Prop Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.performance.tuning=1 \
    keyguard.no_require_sim=true \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.max.fling_velocity=12000 \
    ro.min.fling_velocity=8000 \
    ro.ril.enable.amr.wideband=1 \
    ro.sys.fw.bg_apps_limit=20 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.google.networklocation=0 \
    touch.pressure.scale=2 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150

# Battery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_power_saving=1 \
    ro.ril.disable.power.collapse=0 \
    persist.radio.add_power_save=1 \
    persist.sys.use_dithering=0 \
    pm.sleep_mode=1 \
    power_supply.wakeup=enable \
    power.saving.mode=1

