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
PRODUCT_VERSION_MINOR = 0.0
PRODUCT_VERSION_MAINTENANCE = 0.7
TWISTED_BUILD_TYPE =rebase

TWISTED_POSTFIX := $(shell date +"%Y%m%d-%H%M")

# Set all versions
TWISTED_VERSION := $(TWISTED_BUILD_TYPE)-$(PRODUCT_VERSION_MAINTENANCE)
TWISTED_MOD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TWISTED_BUILD_TYPE)-$(PRODUCT_VERSION_MAINTENANCE)-$(TWISTED_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.twisted.version=$(TWISTED_VERSION) \
    ro.modversion=$(TWISTED_MOD_VERSION)

