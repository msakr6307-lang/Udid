export TARGET = iphone:latest:11.0
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BypassTweak
BypassTweak_FILES = Tweak.x
BypassTweak_CFLAGS = -fobjc-arc
BypassTweak_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/tweak.mk
