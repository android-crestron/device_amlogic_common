#!/system/bin/sh
# Program: Bluetooth(CSR881) module reset
# Made by: Anderson
# Date   : 2016/02/02
#

export LD_LIBRARY_PATH=/lib

# Reset CSR8811
echo "[BTT] Reset CSR8811"
if [ -e /tmp/btt_jabil ]; then
	/system/bin/hciconfig hci0 down
	killall hciattach
	rm /tmp/btt_jabil
fi
echo 0 > /sys/devices/platform/bt-dev/rfkill/rfkill0/state
echo 1 > /sys/devices/platform/bt-dev/rfkill/rfkill0/state
/system/bin/bccmd -t bcsp -d /dev/ttyS1 -b 115200 psload -r /tmp/PSR-CSR8811.psr
/system/bin/hciattach -s 115200 /dev/ttyS1 bcsp 115200
/system/bin/hciconfig hci0 up
touch /tmp/btt_jabil


echo ""
echo ""

