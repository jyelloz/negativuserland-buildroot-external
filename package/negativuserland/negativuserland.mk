################################################################################
#
# negativuserland
#
################################################################################

NEGATIVUSERLAND_VERSION_MAJOR = 0.1
NEGATIVUSERLAND_VERSION = $(NEGATIVUSERLAND_VERSION_MAJOR).0
NEGATIVUSERLAND_SITE = $(call github,jyelloz,negativuserland,$(NEGATIVUSERLAND_VERSION))
NEGATIVUSERLAND_DEPENDENCIES = \
	host-pkgconf host-python-meson host-qemu \
	libglib2 libgtk3

NEGATIVUSERLAND_LICENSE = MIT
NEGATIVUSERLAND_LICENSE_FILES = LICENSE LICENSE.rst

ifeq ($(BR2_ENABLE_DEBUG),y)
NEGATIVUSERLAND_BUILD_TYPE = debug
else
NEGATIVUSERLAND_BUILD_TYPE = release
endif

NEGATIVUSERLAND_MESON_OPTS += \
	--prefix=/usr \
	--buildtype=$(NEGATIVUSERLAND_BUILD_TYPE) \
	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
	-Denable_stfl=false

define NEGATIVUSERLAND_CONFIGURE_CMDS
	$(RM) -rf "$(@D)/build"
	$(INSTALL) -d "$(@D)/build"
	$(TARGET_MAKE_ENV) meson.py $(NEGATIVUSERLAND_MESON_OPTS) $(@D) "$(@D)/build"
endef

define NEGATIVUSERLAND_BUILD_CMDS
	$(TARGET_MAKE_ENV) ninja -C "$(@D)/build"
endef

define NEGATIVUSERLAND_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C "$(@D)/build" install
endef

$(eval $(generic-package))
