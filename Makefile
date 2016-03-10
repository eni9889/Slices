#THEOS_DEVICE_IP = 192.168.1.17 #iphone6+
#THEOS_DEVICE_IP = 192.168.1.5 #iphone4s
#THEOS_DEVICE_IP = 192.168.1.6 #ipad
#THEOS_DEVICE_IP = 192.168.1.11 #ipod

THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222

TARGET := iphone:9.2:2.0
ARCHS := armv7 armv7s arm64

XXX_LDFLAGS += -Wl,-segalign,4000
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include theos/makefiles/common.mk

TWEAK_NAME = Slices
Slices_FILES = Model/AppGroupSlicer.mm Model/Expetelek/Expetelek.mm Tweak.xm Model/RawSlicer.mm Model/Slicer.mm Model/FolderMigrator.mm Model/SliceSetting.mm
Slices_FRAMEWORKS = UIKit
Slices_PRIVATE_FRAMEWORKS = BackBoardServices
Slices_LIBRARIES = MobileGestalt applist

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += slicespreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
