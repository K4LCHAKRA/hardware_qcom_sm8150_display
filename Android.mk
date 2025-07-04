ifneq ($(TARGET_DISABLE_DISPLAY),true)
sdm-libs := sdm/libs
display-hals := include $(sdm-libs)/utils $(sdm-libs)/core libdebug

ifneq ($(TARGET_IS_HEADLESS), true)
    display-hals += libcopybit liblight hdmi_cec \
                    $(sdm-libs)/hwc2 gpu_tonemapper libdrmutils libhistogram drm.vendor
endif

display-hals += gralloc

ifneq (,$(call is-vendor-board-qcom))
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter ms% msm% apq%,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif
endif #TARGET_DISABLE_DISPLAY
