#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ed-qmi
PKG_VERSION:=v1.0
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=BSP
  TITLE:=EDATEC CM4 LTE BSP
  MAINTAINER:=EDATEC <rxie@edatec.cn>
#   DEPENDS:= +usb-modeswitch\
#  +kmod-mii\
#  +kmod-usb-net\
#  +kmod-usb-wdm\
#  +kmod-usb-net-qmi-wwan\
#  +uqmi\
#  +kmod-usb-serial-option\
#  +kmod-usb-serial\
#  +kmod-usb-serial-wwan\
#  +kmod-i2c-bcm2835 # Not necessary package, which is used to i2c

#  EXTRA_DEPENDS:= usb-modeswitch(>=5.15.0-1)
endef

define Package/$(PKG_NAME)/description
 EDATEC CM4 LTE tools.
endef

TARGET_CFLAGS += -Wall

define Build/Compile
# $(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh

cp -f /tmp/$(PKG_NAME)/lte /etc/init.d/
service lte enable
service lte start

endef

define Package/$(PKG_NAME)/install

	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) ./files/quectel-CM  $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) ./files/lte-reconnect.sh $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/tmp/$(PKG_NAME)
	$(INSTALL_BIN) ./files/lte  $(1)/tmp/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh

service lte stop >/dev/null 2 >&1
service lte disable

if [ -e "/usr/share/ed-qmi" ];then
	rm -rf /usr/share/ed-qmi/
fi

if [ -e "/etc/inid.d/lte" ];then
	rm /etc/init.d/lte
fi
endef

$(eval $(call BuildPackage,$(PKG_NAME)))