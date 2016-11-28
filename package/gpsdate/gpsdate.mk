################################################################################
#
# gpsdate
#
################################################################################

GPSDATE_VERSION = 81690ca78e816f86e0da11bbe8cba725fa1a634d
GPSDATE_SITE = $(call github,jyelloz,gpsdate-sysmocom,$(GPSDATE_VERSION))
GPSDATE_DEPENDENCIES = gpsd
GPSDATE_LICENSE = GPLv2
GPSDATE_LICENSE_FILES = COPYING

define GPSDATE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C "$(@D)" $(TARGET_CONFIGURE_OPTS)
endef

define GPSDATE_INSTALL_TARGET_CMDS
	$(INSTALL) "$(@D)/gpsdate" "$(TARGET_DIR)/usr/sbin"
endef

$(eval $(generic-package))
