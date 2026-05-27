TARGET := iphone:clang:latest:14.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Udid
Udid_FILES = Tweak.x
Udid_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
