# Chainfire SuperSU v2.46
SU_VERSION_MAJOR := 2
SU_VERSION_MINOR := 46
SU_VERSION := v$(SU_VERSION_MAJOR).$(SU_VERSION_MINOR)

PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/common/supersu/SuperSU-$(SU_VERSION).zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/deso/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
