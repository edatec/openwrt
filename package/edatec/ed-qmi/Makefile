#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ed-qmi
PKG_VERSION:=v1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=BSP
  TITLE:=EDATEC CM4 LTE BSP
  MAINTAINER:=EDATEC <rxie@edatec.cn>
  DEPENDS:= +usb-modeswitch\
 +kmod-mii\
 +kmod-usb-net\
 +kmod-usb-wdm\
 +kmod-usb-net-qmi-wwan\
 +uqmi\
 +kmod-usb-serial-option\
 +kmod-usb-serial\
 +kmod-usb-serial-wwan
endef

define Package/$(PKG_NAME)/description
 EDATEC CM4 LTE tools.
endef

TARGET_CFLAGS += -Wall

define Build/Compile
# $(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/postinst
# #!/bin/sh

# echo "Installing LTE BSP..."
# mkdir -p /usr/share/ed-qmi
# cp -f /tmp/$(PKG_NAME)/quectel-CM /usr/share/ed-qmi/
# cp -f /tmp/$(PKG_NAME)/lte-reconnect.sh /usr/share/ed-qmi/
# cp -f /tmp/$(PKG_NAME)/lte /etc/init.d/

endef

define Package/$(PKG_NAME)/install

	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) ./files/quectel-CM  $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) ./files/lte-reconnect.sh $(1)/usr/share/$(PKG_NAME)
	# $(INSTALL_DIR) $(1)/etc/init.d
	# $(INSTALL_BIN) ./files/lte  $(1)/etc/init.d/

endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh

service lte disable

if [ -e "/usr/share/ed-qmi" ];then
	rm -rf /usr/share/ed-qmi/
fi

if [ -e "/etc/inid.d/lte" ];then
	rm /etc/init.d/lte
fi
endef

$(eval $(call BuildPackage,$(PKG_NAME)))