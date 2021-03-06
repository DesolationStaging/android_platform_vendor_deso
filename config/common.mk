PRODUCT_BRAND ?= deso

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.selinux=1 \
	persist.sys.root_access=3 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1 \
        ro.max.fling_velocity=14000 \
        ro.min.fling_velocity=9000 \
        persist.sys.scrollingcache=3

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	enable_desotweak=true

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/deso/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/deso/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/deso/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
	vendor/deso/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with deso extras
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/etc/init.local.rc:root/init.aicp.rc \
    vendor/deso/prebuilt/etc/init.d/91customdensity:/system/etc/init.d/91customdensity

#Add System rewriteable/read only scripts
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/bin/sysrw:system/bin/sysrw  \
    vendor/deso/prebuilt/bin/sysrw:system/bin/sysro

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Signature compatibility validation from CM
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# Additional packages
-include vendor/deso/config/packages.mk

# Versioning
-include vendor/deso/config/version.mk

# Chainfire SuperSU v2.36
-include vendor/deso/config/supersu.mk

-include vendor/deso/sepolicy/sepolicy.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/deso/overlay/common

# Stagefright FFMPEG plugin
#PRODUCT_PACKAGES += \
#    libstagefright_soft_ffmpegadec \
#    libstagefright_soft_ffmpegvdec \
#    libFFmpegExtractor \
#    libnamparser
