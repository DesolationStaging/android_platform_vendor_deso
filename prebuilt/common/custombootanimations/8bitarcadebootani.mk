# boot animation include
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
8BIT_TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
8bit_bootanimation_sizes := $(subst .zip,, $(shell ls vendor/deso/prebuilt/common/custombootanimations/8bitarcade))
8bit_bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(8bit_bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval 8BIT_TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(8BIT_TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(8BIT_TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(8BIT_TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(8bit_bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

# copy boot animation to system
PRODUCT_COPY_FILES += \
    vendor/deso/prebuilt/common/custombootanimations/8bitarcade/$(8BIT_TARGET_BOOTANIMATION_NAME).zip:system/vendor/bootanimations/8bitarcade.zip
endif
