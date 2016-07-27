
ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = WACallConfirm
WACallConfirm_FILES = UIAlert+Blocks.m Tweak.xm
WACallConfirm_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 WhatsApp"
SUBPROJECTS += wacallconfirm
include $(THEOS_MAKE_PATH)/aggregate.mk
