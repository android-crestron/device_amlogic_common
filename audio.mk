#
# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PACKAGES += \
    audio_policy.default \
    audio.primary.amlogic \
    audio.hdmi.amlogic \
    audio.r_submix.default \
    acoustics.default \
    audio_firmware


#PRODUCT_COPY_FILES += \
#    $(TARGET_PRODUCT_DIR)/audio_policy.conf:system/etc/audio_policy.conf \
#    $(TARGET_PRODUCT_DIR)/audio_effects.conf:system/etc/audio_effects.conf

#arm audio decoder lib
soft_adec_libs := $(shell ls vendor/amlogic/frameworks/av/LibPlayer/amadec/acodec_lib)
PRODUCT_COPY_FILES += $(foreach file, $(soft_adec_libs), \
        vendor/amlogic/frameworks/av/LibPlayer/amadec/acodec_lib_50/$(file):system/lib/$(file))
        
#audio data ko 
PRODUCT_COPY_FILES += device/amlogic/common/audio/audio_data.ko:system/lib/audio_data.ko        

################################################################################## alsa

ifeq ($(BOARD_ALSA_AUDIO),legacy)

PRODUCT_COPY_FILES += \
	$(TARGET_PRODUCT_DIR)/asound.conf:system/etc/asound.conf \
	$(TARGET_PRODUCT_DIR)/asound.state:system/etc/asound.state

BUILD_WITH_ALSA_UTILS := true

PRODUCT_PACKAGES += \
    alsa.default \
    libasound \
    alsa_aplay \
    alsa_ctl \
    alsa_amixer \
    alsainit-00main \
    alsalib-alsaconf \
    alsalib-pcmdefaultconf \
    alsalib-cardsaliasesconf
endif

################################################################################## tinyalsa

ifeq ($(BOARD_ALSA_AUDIO),tiny)

BUILD_WITH_ALSA_UTILS := false

# Audio
PRODUCT_PACKAGES += \
    audio.usb.default \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    audio.usb.amlogic
endif

################################################################################## tfa9890

ifeq ($(BOARD_AUDIO_AMPLIFIER),tfa9890)
PRODUCT_PACKAGES += \
    libhal \
    libtfa \
    libsrv \
    libjbl_acoustic\
    climax_hostSW

PRODUCT_COPY_FILES += \
    device/amlogic/common/audio/tfa9890/settings_yushan/stereo.ini:root/jabil/tfa9890/settings_yushan/stereo.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan/stereo.cnt:root/jabil/tfa9890/settings_yushan/stereo.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan/mono.ini:root/jabil/tfa9890/settings_yushan/mono.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan/mono.cnt:root/jabil/tfa9890/settings_yushan/mono.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan/config/TFA9890_N1B12_N1C3_v3.config:root/jabil/tfa9890/settings_yushan/config/TFA9890_N1B12_N1C3_v3.config \
    device/amlogic/common/audio/tfa9890/settings_yushan/patch/TFA9890_N1C3_2_1_1.patch:root/jabil/tfa9890/settings_yushan/patch/TFA9890_N1C3_2_1_1.patch \
    device/amlogic/common/audio/tfa9890/settings_yushan/speaker/Jabil1005.speaker:root/jabil/tfa9890/settings_yushan/speaker/Jabil1005.speaker \
    device/amlogic/common/audio/tfa9890/settings_yushan/vstep/Jabil_0202_HQ.vstep:root/jabil/tfa9890/settings_yushan/vstep/Jabil_0202_HQ.vstep \
    device/amlogic/common/audio/tfa9890/settings_yushan/vstep/Jabil_0202_voice.vstep:root/jabil/tfa9890/settings_yushan/vstep/Jabil_0202_voice.vstep

PRODUCT_COPY_FILES += \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/stereo.ini:root/jabil/tfa9890/settings_yushan_2nd/stereo.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/stereo.cnt:root/jabil/tfa9890/settings_yushan_2nd/stereo.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/mono.ini:root/jabil/tfa9890/settings_yushan_2nd/mono.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/mono.cnt:root/jabil/tfa9890/settings_yushan_2nd/mono.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/config/TFA9890_N1B12_N1C3_v3.config:root/jabil/tfa9890/settings_yushan_2nd/config/TFA9890_N1B12_N1C3_v3.config \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/patch/TFA9890_N1C3_2_1_1.patch:root/jabil/tfa9890/settings_yushan_2nd/patch/TFA9890_N1C3_2_1_1.patch \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/speaker/Jabil1223_Seltech2.speaker:root/jabil/tfa9890/settings_yushan_2nd/speaker/Jabil1223_Seltech2.speaker \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/vstep/Jabil_1223_Seltech2_HQ.vstep:root/jabil/tfa9890/settings_yushan_2nd/vstep/Jabil_1223_Seltech2_HQ.vstep \
    device/amlogic/common/audio/tfa9890/settings_yushan_2nd/vstep/Jabil_1223_Seltech2_voice.vstep:root/jabil/tfa9890/settings_yushan_2nd/vstep/Jabil_1223_Seltech2_voice.vstep

PRODUCT_COPY_FILES += \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/stereo.ini:root/jabil/tfa9890/settings_yushan_3rd/stereo.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/stereo.cnt:root/jabil/tfa9890/settings_yushan_3rd/stereo.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/mono.ini:root/jabil/tfa9890/settings_yushan_3rd/mono.ini \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/mono.cnt:root/jabil/tfa9890/settings_yushan_3rd/mono.cnt \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/config/TFA9890_N1B12_N1C3_v3.config:root/jabil/tfa9890/settings_yushan_3rd/config/TFA9890_N1B12_N1C3_v3.config \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/patch/TFA9890_N1C3_2_1_1.patch:root/jabil/tfa9890/settings_yushan_3rd/patch/TFA9890_N1C3_2_1_1.patch \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/speaker/Jabil0223_DS_SlimE.speaker:root/jabil/tfa9890/settings_yushan_3rd/speaker/Jabil0223_DS_SlimE.speaker \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/vstep/Jabil_0223_DS_SlimE_HQ.vstep:root/jabil/tfa9890/settings_yushan_3rd/vstep/Jabil_0223_DS_SlimE_HQ.vstep \
    device/amlogic/common/audio/tfa9890/settings_yushan_3rd/vstep/Jabil_0223_DS_SlimE_voice.vstep:root/jabil/tfa9890/settings_yushan_3rd/vstep/Jabil_0223_DS_SlimE_voice.vstep
endif

PRODUCT_PACKAGES += \
    libhal_twolf \
    twolf_i2c_access \
    twolf_hal_verify \
    twolf_ldfwcfg

PRODUCT_COPY_FILES += \
    device/amlogic/common/audio/zl38051/5inch/ZL38051App_svn5565.s3:root/jabil/zl38051/5inch/ZL38051App_svn5565.s3 \
    device/amlogic/common/audio/zl38051/5inch/ZL38051_P1.4.1.s3:root/jabil/zl38051/5inch/ZL38051_P1.4.1.s3 \
    device/amlogic/common/audio/zl38051/5inch/ZLS38051_Small_Tablet_jan7_1400_with_ver_info.cr2:root/jabil/zl38051/5inch/ZLS38051_Small_Tablet_jan7_1400_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/5inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2:root/jabil/zl38051/5inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/7inch/ZL38051App_svn5565.s3:root/jabil/zl38051/7inch/ZL38051App_svn5565.s3 \
    device/amlogic/common/audio/zl38051/7inch/ZL38051_P1.4.1.s3:root/jabil/zl38051/7inch/ZL38051_P1.4.1.s3 \
    device/amlogic/common/audio/zl38051/7inch/ZLS38051_Medium_Tablet_Jan12_1405_with_ver_info.cr2:root/jabil/zl38051/7inch/ZLS38051_Medium_Tablet_Jan12_1405_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/7inch/ZLS38051_Medium_Tablet_Mar17_1310_PowerSavings_with_ver_info.cr2:root/jabil/zl38051/7inch/ZLS38051_Medium_Tablet_Mar17_1310_PowerSavings_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/7inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2:root/jabil/zl38051/7inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/10inch/ZL38051App_svn5565.s3:root/jabil/zl38051/10inch/ZL38051App_svn5565.s3 \
    device/amlogic/common/audio/zl38051/10inch/ZL38051_P1.4.1.s3:root/jabil/zl38051/10inch/ZL38051_P1.4.1.s3 \
    device/amlogic/common/audio/zl38051/10inch/ZLS38051_Large_Tablet_dec18_1500_with_ver_info.cr2:root/jabil/zl38051/10inch/ZLS38051_Large_Tablet_dec18_1500_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/10inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2:root/jabil/zl38051/10inch/ZLS38051_All_Sizes_may12_1400_with_ver_info.cr2 \
    device/amlogic/common/audio/zl38051/script/clrMSCCadaptDisBit.sh:root/jabil/zl38051/script/clrMSCCadaptDisBit.sh \
    device/amlogic/common/audio/zl38051/script/setMSCCadaptDisBit.sh:root/jabil/zl38051/script/setMSCCadaptDisBit.sh

##################################################################################
ifneq ($(wildcard $(TARGET_PRODUCT_DIR)/mixer_paths.xml),)
    PRODUCT_COPY_FILES += \
        $(TARGET_PRODUCT_DIR)/mixer_paths.xml:system/etc/mixer_paths.xml
else
    ifeq ($(BOARD_AUDIO_CODEC),rt5631)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/rt5631_mixer_paths.xml:system/etc/mixer_paths.xml
    endif

    ifeq ($(BOARD_AUDIO_CODEC),rt5616)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/rt5616_mixer_paths.xml:system/etc/mixer_paths.xml
    endif 

    ifeq ($(BOARD_AUDIO_CODEC),wm8960)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/wm8960_mixer_paths.xml:system/etc/mixer_paths.xml
    endif
    
    ifeq ($(BOARD_AUDIO_CODEC),dummy)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/dummy_mixer_paths.xml:system/etc/mixer_paths.xml
    endif

    ifeq ($(BOARD_AUDIO_CODEC),m8_codec)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/m8codec_mixer_paths.xml:system/etc/mixer_paths.xml
    endif
    
    ifeq ($(BOARD_AUDIO_CODEC),amlpmu3)
        PRODUCT_COPY_FILES += \
            hardware/amlogic/audio/amlpmu3_mixer_paths.xml:system/etc/mixer_paths.xml
    endif
endif
