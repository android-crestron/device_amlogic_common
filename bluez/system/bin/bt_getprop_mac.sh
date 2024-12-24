#!/system/bin/sh
#

# Get property of BT MAC address
mac_bt=`toolbox getprop ro.boot.mac_bt`

echo "BT MAC address = $mac_bt"

# Parsing the element of BT MAC address
mac_1=${mac_bt:0:2}
mac_2=${mac_bt:3:2}
mac_3=${mac_bt:6:2}
mac_4=${mac_bt:9:2}
mac_5=${mac_bt:12:2}
mac_6=${mac_bt:15:2}

#echo $mac_1
#echo $mac_2
#echo $mac_3
#echo $mac_4
#echo $mac_5
#echo $mac_6

# Write the BDADDR string to /tmp/PSR-bt_mac.psr
echo "&0001 = 00$mac_4 $mac_5$mac_6 00$mac_3 $mac_1$mac_2" > /tmp/PSR-bt_mac.psr

