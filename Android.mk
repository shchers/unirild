# Copyright 2012 Sergey Shcherbakov <shchers@gmail.com>

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	unirild.c

# Original RILd main module
LOCAL_SRC_FILES += \
	../ril/rild/rild.c


LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libril

ifeq ($(TARGET_ARCH),arm)
LOCAL_SHARED_LIBRARIES += libdl
endif # arm

LOCAL_CFLAGS := -DRIL_SHLIB

# Redefining entry point from "main" to "newmain"
LOCAL_LDFLAGS := -Wl,-enewmain

LOCAL_MODULE:= unirild
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
