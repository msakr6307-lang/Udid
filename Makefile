TARGET := iphone:clang:latest:15.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MySpooferTool

# هنا بتكتب اسم ملف الكود بتاعك (مثلاً Tweak.x أو Spoofer.mm)
MySpooferTool_FILES = Tweak.x
MySpooferTool_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
