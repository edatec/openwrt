#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ed-cm4ind
PKG_VERSION:=v1.0
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=BSP
  TITLE:=EDATEC CM4 Industrial BSP
  MAINTAINER:=EDATEC <rxie@edatec.cn>
endef

define Package/$(PKG_NAME)/description
 EDATEC CM4 Industrial BSP, support the second ethernet, RS485, RS232, CAN and ADC.
endef

TARGET_CFLAGS += -Wall

define Build/Compile
#	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh

if [ ! -e "stmpe811.dtbo" ];then
	cp /tmp/$(PKG_NAME)/stmpe811.dtbo /boot/overlays/
fi

if [ ! -e "/boot/dt-blob.bin" ];then
	cp /tmp/$(PKG_NAME)/dt-blob.bin /boot
fi

/tmp/$(PKG_NAME)/insert.sh

endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/insert.sh  $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/stmpe811.dtbo  $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/dt-blob.bin  $(1)/tmp/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh

if [ -e "stmpe811.dtbo" ];then
	rm /boot/overlays/stmpe811.dtbo
fi

if [ ! -e "/boot/dt-blob.bin" ];then
	cp /tmp/$(PKG_NAME)/dt-blob.bin /boot
fi

endef

$(eval $(call BuildPackage,$(PKG_NAME)))