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
TWISTED_MOD_VERSION := twisted-$(TWISTED_DEVICE_SHORT)-$(SCREWD_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ota.version=$(PRODUCT_VERSION_MAJOR)-$(TWISTED_POSTFIX) \
    ro.twisted.version=$(TWISTED_VERSION) \
    ro.modversion=$(TWISTED_MOD_VERSION) \
    ro.twisted.buildtype=$(TWISTED_BUILD_TYPE)

