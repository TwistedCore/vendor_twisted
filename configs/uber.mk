# Written for UBER toolchains (UBERTC)
# Requires a Linux Host

UNAME := $(shell uname -s)
ifeq (Linux,$(UNAME))
  HOST_OS := linux
endif

ifeq (linux,$(HOST_OS))
  AND_CLANG_VERSION := $(shell prebuilts/clang/host/$(HOST_PREBUILT_TAG)/$(LLVM_PREBUILTS_VERSION)/bin/clang --version | grep "clang " 2>&1)

  space :=
  space +=
  AND_CLANG_VERSION := $(subst $(space),-,$(strip $(AND_CLANG_VERSION)))

  ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.clang=$(AND_CLANG_VERSION)

  ifeq (arm,$(TARGET_ARCH))

    # ANDROIDEABI TOOLCHAIN INFO
    AND_TC_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-$(TARGET_GCC_VERSION)
    AND_TC_VERSION := $(shell $(AND_TC_PATH)/bin/arm-linux-androideabi-gcc --version 2>&1)
    AND_TC_VERSION_NUMBER := $(shell $(AND_TC_PATH)/bin/arm-linux-androideabi-gcc -dumpversion 2>&1)
    AND_TC_DATE := $(filter 20150% 20151% 20160% 20161% 20170% 20171%,$(AND_TC_VERSION))

    ifneq ($(filter (UBERTC%),$(AND_TC_VERSION)),)
      AND_TC_NAME := UBERTC
    else
      AND_TC_NAME := GCC
    endif

    ifeq (,$(AND_TC_DATE))
      ARM_AND_PROP := $(AND_TC_NAME)-$(AND_TC_VERSION_NUMBER)
    else
      ARM_AND_PROP := ($(AND_TC_NAME)-$(AND_TC_VERSION_NUMBER))-$(AND_TC_DATE)
    endif

    ADDITIONAL_BUILD_PROPERTIES += \
      ro.build.gcc=$(ARM_AND_PROP)
