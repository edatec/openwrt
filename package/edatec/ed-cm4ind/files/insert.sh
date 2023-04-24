#!/bin/sh

CONFIG_FILE=/boot/config.txt


echo "Modifying config.txt..."

grep -q dtoverlay=spi1-1cs,cs0_pin=16 $CONFIG_FILE || \
        echo -e dtoverlay=spi1-1cs,cs0_pin=16 >> $CONFIG_FILE
grep -q dtoverlay=jedec-spi-nor,flash-spi1-0 $CONFIG_FILE || \
        echo -e dtoverlay=jedec-spi-nor,flash-spi1-0 >> $CONFIG_FILE
grep -q dtoverlay=i2c-rtc,pcf8563 $CONFIG_FILE || \
        echo -e dtoverlay=i2c-rtc,pcf8563 >> $CONFIG_FILE
grep -q dtoverlay=ads1015,cha_gain=1,chb_gain=1,chc_gain=1,chd_gain=1 $CONFIG_FILE || \
        echo -e dtoverlay=ads1015,cha_gain=1,chb_gain=1,chc_gain=1,chd_gain=1 >> $CONFIG_FILE
grep -q gpio=7=ip,pu $CONFIG_FILE || \
        echo -e gpio=7=ip,pu >> $CONFIG_FILE
grep -q dtoverlay=uart3 $CONFIG_FILE || \
        echo -e dtoverlay=uart3 >> $CONFIG_FILE
grep -q dtoverlay=uart4 $CONFIG_FILE || \
        echo -e dtoverlay=uart4 >> $CONFIG_FILE
grep -q dtoverlay=uart5 $CONFIG_FILE || \
        echo -e dtoverlay=uart5 >> $CONFIG_FILE
grep -q gpio=6=ip,pu $CONFIG_FILE || \
        echo -e gpio=6=ip,pu >> $CONFIG_FILE

echo "---------------------------------------------"
echo
echo "End! Please reboot to apply the changes!!!"
echo
echo "---------------------------------------------"