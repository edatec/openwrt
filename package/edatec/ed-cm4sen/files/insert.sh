#!/bin/sh

CONFIG_FILE=/boot/config.txt


echo "Modifying config.txt..."

grep -q otg_mode=1 $CONFIG_FILE || \
        echo -e otg_mode=1 >> $CONFIG_FILE
grep -q enable_uart=1 $CONFIG_FILE || \
        echo -e enable_uart=1 >> $CONFIG_FILE
grep -q dtoverlay=ed-sdhost $CONFIG_FILE || \
        echo -e dtoverlay=ed-sdhost >> $CONFIG_FILE
grep -q dtoverlay=i2c-rtc,pcf8563 $CONFIG_FILE || \
        echo -e dtoverlay=i2c-rtc,pcf8563 >> $CONFIG_FILE
grep -q dtoverlay=spi1-1cs,cs0_pin=18,cs0_spidev=disabled $CONFIG_FILE || \
        echo -e dtoverlay=spi1-1cs,cs0_pin=18,cs0_spidev=disabled >> $CONFIG_FILE
grep -q dtoverlay=ed-mcp2515-spi1-can0 $CONFIG_FILE || \
        echo -e dtoverlay=ed-mcp2515-spi1-can0 >> $CONFIG_FILE
grep -q dtoverlay=uart2 $CONFIG_FILE || \
        echo -e dtoverlay=uart2 >> $CONFIG_FILE
grep -q dtoverlay=uart3 $CONFIG_FILE || \
        echo -e dtoverlay=uart3 >> $CONFIG_FILE
grep -q dtoverlay=uart4 $CONFIG_FILE || \
        echo -e dtoverlay=uart4 >> $CONFIG_FILE
grep -q dtoverlay=uart5 $CONFIG_FILE || \
        echo -e dtoverlay=uart5 >> $CONFIG_FILE
grep -q gpio=11=op,dl $CONFIG_FILE || \
        echo -e gpio=11=op,dl >> $CONFIG_FILE
grep -q dtparam=ant2 $CONFIG_FILE || \
        echo -e dtparam=ant2 >> $CONFIG_FILE
        
echo "---------------------------------------------"
echo
echo "End! Please reboot to apply the changes!!!"
echo
echo "---------------------------------------------"