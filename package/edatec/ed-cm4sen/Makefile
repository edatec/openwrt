#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ed-cm4sen
PKG_VERSION:=v1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=BSP
  TITLE:=EDATEC CM4 Sensing BSP
  MAINTAINER:=EDATEC <rxie@edatec.cn>
  DEPENDS+= +kmod-i2c-bcm2835
endef

define Package/$(PKG_NAME)/description
 EDATEC CM4 Sensing BSP, support RS485 RS232 and CAN.
endef

TARGET_CFLAGS += -Wall

define Build/Compile
# $(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/postinst
# #!/bin/sh

# echo "Installing dtbo..."
# if [ ! -e "/boot/overlays/ed-mcp2515-spi1-can0.dtbo" ];then
# 	cp /tmp/$(PKG_NAME)/ed-mcp2515-spi1-can0.dtbo /boot/overlays/
# fi

# if [ ! -e "/boot/overlays/ed-sdhost.dtbo" ];then
# 	cp /tmp/$(PKG_NAME)/ed-sdhost.dtbo /boot/overlays/
# fi

# if [ ! -e "/boot/dt-blob.bin" ];then
# 	cp /tmp/$(PKG_NAME)/dt-blob.bin /boot
# fi

# /tmp/$(PKG_NAME)/insert.sh

endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/insert.sh  $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/ed-mcp2515-spi1-can0.dtbo  $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/ed-sdhost.dtbo  $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/dt-blob.bin  $(1)/tmp/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh

if [ -e "/boot/overlays/ed-mcp2515-spi1-can0.dtbo" ];then
	rm /boot/overlays/ed-mcp2515-spi1-can0.dtbo
fi

if [ -e "/boot/overlays/ed-sdhost.dtbo" ];then
	rm /boot/overlays/ed-sdhost.dtbo
fi

if [ -e "/boot/dt-blob.bin" ];then
	rm /boot/dt-blob.bin
fi
endef

$(eval $(call BuildPackage,$(PKG_NAME)))