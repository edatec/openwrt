#!/bin/sh 

BSP_HOME_PATH=/usr/share/ed-qmi
LTE_RST_PIN=10
LOG_PATH=/var/log/ed-ec20-qmi
LOGFILE=$LOG_PATH/quectel-CM.log

function do_lte_init_rst_pin(){
    echo ${LTE_RST_PIN} > /sys/class/gpio/export
    echo out > /sys/class/gpio/gpio${LTE_RST_PIN}/direction
}

function do_lte_rst() {
    echo 1 > /sys/class/gpio/gpio${LTE_RST_PIN}/value
    sleep 1
    echo 0 > /sys/class/gpio/gpio${LTE_RST_PIN}/value
    # it takes a while to load the device after reset
    sleep 10

    until [ -e /sys/class/net/wwan0 ]
    do
        sleep 1
    done
}

function do_connect() {
    printf "Kill all quectel-CM ...\n"
    killall -q quectel-CM

    printf "Reset lte module ...\n"
    do_lte_rst

    printf "Try to connect ...\n"
    $BSP_HOME_PATH/quectel-CM -4 -f $LOGFILE &
}

mkdir -p $LOG_PATH
do_lte_init_rst_pin

while true; do

    # it's better to ping a ip rather than a domain
    # ping Alibaba DNS server
    ping -I wwan0 -c 1 -s 0 223.5.5.5

    if [ ! $? -eq 0 ]; then
        echo "Connection down, reconnecting..."
        do_connect
    fi

    sleep 20
done
