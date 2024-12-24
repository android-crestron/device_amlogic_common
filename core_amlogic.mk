# Inherit from those products. Most specific first.
# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)

# Get the TTS language packs
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)

# Get a list of languages.
$(call inherit-product, build/target/product/locales_full.mk)

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.config.notification_sound=pixiedust.ogg

# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US

# Include drawables for all densities
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi

# Crestron request us to remove the following packages to reduce memory using
#PRODUCT_PACKAGES += \
    MusicFX \
    OneTimeInitializer \
    CalendarProvider \
    ManagedProvisioning \
    OTAUpgrade \
    RemoteIME \
    SubTitle 

PRODUCT_PACKAGES += \
    libfwdlockengine \
    OpenWnn \
    libWnnEngDic \
    libWnnJpnDic \
    libwnndict \
    WAPPushManager

PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable

PRODUCT_PACKAGES += \
    Camera2 \
    Gallery2 \
    Music \
    Provision \
    SystemUI \
    WallpaperCropper

PRODUCT_PACKAGES += \
    clatd \
    clatd.conf \
    pppd \
    screenrecord

PRODUCT_PACKAGES += \
    librs_jni \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer \

PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.default \
    local_time.default \
    vibrator.default \
    power.default

PRODUCT_PACKAGES += \
    local_time.default

PRODUCT_COPY_FILES += \
        frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

PRODUCT_COPY_FILES += \
        frameworks/base/cmds/gamma_adj/TSW_GammaTable.txt:system/etc/TSW_GammaTable.txt

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown

PRODUCT_PACKAGES += \
    BasicDreams \
    Browser \
    CaptivePortalLogin \
    CertInstaller \
    DeskClock \
    DocumentsUI \
    Exchange2 \
    ExternalStorageProvider \
    FusedLocation \
    InputDevices \
    KeyChain \
    Keyguard \
    LatinIME \
    Launcher2 \
    PacProcessor \
    libpac \
    ProxyHandler \
    Settings \
    SharedStorageBackup \
    VpnDialogs

PRODUCT_PACKAGES += \
    sensorservice

# SNMP 
PRODUCT_PACKAGES += \
        libsnmpAgent \
        snmpd \
        crestronTouchMIB \
        crestronMIB

# STM32 FW images
PRODUCT_PACKAGES += \
	    csign_image \
	    dm-bootCSIGN_image

$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)
$(call inherit-product, build/target/product/core_base.mk)

ifneq ($(wildcard vendor/amlogic/frameworks/av/LibPlayer),)
    WITH_LIBPLAYER_MODULE := true
else
    WITH_LIBPLAYER_MODULE := false
endif

# set soft stagefright extractor&decoder as defaults
WITH_SOFT_AM_EXTRACTOR_DECODER := true

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    camera.disable_zsl_mode=1

PRODUCT_BOOT_JARS += \
    droidlogic \
    droidlogic.frameworks.pppoe

PRODUCT_PACKAGES += \
    droidlogic \
    droidlogic-res \
    systemcontrol \
    systemcontrol_static \
    VideoPlayer \
    AppInstaller \
    FileBrowser \
    dig \
    PromptUser \
    Miracast

PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf \
    libds_jni \
    libsrec_jni \
    system_key_server \
    libwifi-hal \
    libwpa_client \
    libGLES_mali \
    network \
    sdptool \
    e2fsck \
    mkfs.exfat \
    mount.exfat \
    fsck.exfat \
    ntfs-3g \
    ntfsfix \
    mkntfs \
    gralloc.amlogic \
    power.amlogic \
    hwcomposer.amlogic \
    memtrack.amlogic \
    screen_source.amlogic

#glscaler and 3d format api
PRODUCT_PACKAGES += \
    libdisplaysetting

#native image player surface overlay so
PRODUCT_PACKAGES += \
    libsurfaceoverlay_jni

PRODUCT_PACKAGES += libomx_av_core_alt \
    libOmxCore \
    libOmxVideo \
    libthreadworker_alt \
    libdatachunkqueue_alt \
    libOmxBase \
    libomx_framework_alt \
    libomx_worker_peer_alt \
    libfpscalculator_alt \
    libomx_clock_utils_alt \
    libomx_timed_task_queue_alt \
    libstagefrighthw \
    libsecmem \
    secmem

PRODUCT_COPY_FILES += \
    device/amlogic/$(TARGET_PRODUCT)/u-boot.bin:u-boot.bin

PRODUCT_PACKAGES += crestronbootimage2.data

# Dm-verity
ifeq ($(BUILD_WITH_DM_VERITY), true)
PRODUCT_SYSTEM_VERITY_PARTITION = /dev/block/system
# Provides dependencies necessary for verified boot
PRODUCT_SUPPORTS_VERITY := true
# The dev key is used to sign boot and recovery images, and the verity
# metadata table. Actual product deliverables will be re-signed by hand.
# We expect this file to exist with the suffixes ".x509.pem" and ".pk8".
PRODUCT_VERITY_SIGNING_KEY := device/amlogic/common/security/verity
PRODUCT_PACKAGES += \
        verity_key.amlogic
endif

#########################################################################
#
#                                                App optimization
#
#########################################################################
#ifeq ($(BUILD_WITH_APP_OPTIMIZATION),true)

PRODUCT_COPY_FILES += \
    device/amlogic/common/optimization/liboptimization.so:system/lib/liboptimization.so \
    device/amlogic/common/optimization/config:system/package_config/config

PRODUCT_PROPERTY_OVERRIDES += \
    ro.app.optimization=true

#endif

#########################################################################
#
#                          Alarm white and black list
#
#########################################################################
PRODUCT_COPY_FILES += \
    device/amlogic/common/alarm/alarm_blacklist.txt:/system/etc/alarm_blacklist.txt \
    device/amlogic/common/alarm/alarm_whitelist.txt:/system/etc/alarm_whitelist.txt

# Touch screen features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#copy all possible idc to target
PRODUCT_COPY_FILES += \
    device/amlogic/common/idc/ft5x06.idc:system/usr/idc/ft5x06.idc \
    device/amlogic/common/idc/pixcir168.idc:system/usr/idc/pixcir168.idc \
    device/amlogic/common/idc/ssd253x-ts.idc:system/usr/idc/ssd253x-ts.idc \
    device/amlogic/common/idc/Vendor_222a_Product_0001.idc:system/usr/idc/Vendor_222a_Product_0001.idc \
    device/amlogic/common/idc/Vendor_dead_Product_beef.idc:system/usr/idc/Vendor_dead_Product_beef.idc \
    device/amlogic/common/idc/mg-capacitive.idc:system/usr/idc/mg-capacitive.idc

#########################################################################
#
#                                     OTA PROPERTY
#
#########################################################################
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.firmware=00502001 \
    ro.product.otaupdateurl=http://10.28.11.53:8080/otaupdate/update
