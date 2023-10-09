ZIP_FILES := $(filter-out Makefile .git%,$(wildcard *))
VERSION = v3.43.1
VERSIONCODE = 3430100
.PHONY: zip module.prop system/xbin/sqlite3

default: zip module.prop system/xbin/sqlite3

zip:
	rm -f SQLite.for.ARM.aarch64.devices-$(VERSION).zip
	zip -0 -r SQLite.for.ARM.aarch64.devices-$(VERSION).zip $(ZIP_FILES)

module.prop:
	sed -i 's/version=.*$$/version=$(VERSION)/' module.prop
	sed -i 's/versionCode=.*$$/versionCode=$(VERSIONCODE)/' module.prop

system/xbin/sqlite3:
	cp ../sqlite3-android/libs/armeabi-v7a/sqlite3-static system/xbin/sqlite3
