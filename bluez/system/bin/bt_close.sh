#!/system/bin/sh
# Program: Bluetooth(CSR881) module close
# Made by: Anderson
# Date   : 2016/02/02
#

export LD_LIBRARY_PATH=/lib

# Close CSR8811
echo "[BTT] Close CSR8811"
if [ -e /tmp/btt_jabil ]; then
	/system/bin/hciconfig hci0 down
	killall hciattach
	rm /tmp/btt_jabil
fi


echo ""
echo ""

