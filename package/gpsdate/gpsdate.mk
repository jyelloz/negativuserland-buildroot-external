################################################################################
#
# gpsdate
#
################################################################################

GPSDATE_VERSION = a6487f01061a64cdf1aadcde50cc70b3a8e15457
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

define GPSDATE_INSTALL_INIT_SYSTEMD
	$(INSTALL) -d "$(TARGET_DIR)/usr/lib/systemd/system"
	$(INSTALL) -d "$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants"
	$(INSTALL) "$(@D)/gpsdate.service" "$(TARGET_DIR)/usr/lib/systemd/system"
	ln -svnf "../gpsdate.service" "$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/"
endef

define GPSDATE_INSTALL_INIT_SYSV
	$(INSTALL) -d "$(TARGET_DIR)/etc/init.d"
	$(INSTALL) -d "$(TARGET_DIR)/etc/default"
	$(INSTALL) "$(@D)/gpsdate.init" "$(TARGET_DIR)/etc/init.d/S51gpsdate"
endef

$(eval $(generic-package))
