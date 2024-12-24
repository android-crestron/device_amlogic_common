#!/system/bin/sh
# Program: iBeacon & Bluetooth(CSR881) module init
# Made by: Anderson
# Date   : 2016/02/02
#

# Init iBeacon env 
if [ ! -e /tmp/btt_iBeacon ]; then
	mount -o remount,rw /
	mount -o remount,rw /system

	chmod 700 /system/lib/ld-linux-armhf.so.3

	cd /
	ln -s /system/lib lib

	mkdir /tmp
	chmod 777 /tmp
	mount -t tmpfs -o size=1M tmps /tmp
	touch /tmp/btt_iBeacon

	mount -o remount,ro /system
	mount -o remount,ro /

	# Get BT MAC address from the Android Property
	/system/bin/bt_getprop_mac.sh
	cat /system/bin/PSR-CSR8811.psr /tmp/PSR-bt_mac.psr > /tmp/PSR-CSR8811.psr

	echo "[BTT] Set up iBeacon env done..."
else
	echo "[BTT] Already set up iBeacon env..."
fi

export LD_LIBRARY_PATH=/lib

echo ""
echo ""

# Init CSR8811
if [ ! -e /tmp/btt_jabil ]; then
	echo "[BTT] Init CSR8811"
	echo 0 > /sys/devices/platform/bt-dev/rfkill/rfkill0/state
	echo 1 > /sys/devices/platform/bt-dev/rfkill/rfkill0/state
	/system/bin/bccmd -t bcsp -d /dev/ttyS1 -b 115200 psload -r /tmp/PSR-CSR8811.psr
	/system/bin/hciattach -s 115200 /dev/ttyS1 bcsp 115200
	/system/bin/hciconfig hci0 up
	touch /tmp/btt_jabil
else
	echo "[BTT] CSR8811 already init!"
fi

echo ""
echo ""

