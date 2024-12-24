#! /system/bin/bash

AECControlReg=`twolf_i2c_access -rd 0x302  1 | cut -d " " -f5`
echo "AECControlReg_Pre="$AECControlReg

twolf_i2c_access -wr 0x302 $(( $AECControlReg & 0xfffd )) >> /dev/null #When cleared, the adaptive filter adapts to the echo path characteristics.

AECControlReg=`twolf_i2c_access -rd 0x302  1 | cut -d " " -f5`
echo "AECControlReg_Aft="$AECControlReg
