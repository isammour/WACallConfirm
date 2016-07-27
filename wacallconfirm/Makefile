ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = wacallconfirm
wacallconfirm_FILES = wacallconfirm.mm
wacallconfirm_INSTALL_PATH = /Library/PreferenceBundles
wacallconfirm_FRAMEWORKS = UIKit
wacallconfirm_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/wacallconfirm.plist$(ECHO_END)
