################################################################################
#
# negativuserland-kmod
#
################################################################################

NEGATIVUSERLAND_KMOD_VERSION = 1.0
NEGATIVUSERLAND_KMOD_SITE = $(call github,jyelloz,negativuserland-kmod,$(NEGATIVUSERLAND_KMOD_VERSION))
NEGATIVUSERLAND_KMOD_LICENSE = GPLv2
NEGATIVUSERLAND_KMOD_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
