PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/deso/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml \
    vendor/deso/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_PACKAGES += \
    Stk

-include vendor/deso/config/common.mk
