#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Set kernel version for use in inherited makefiles
TARGET_KERNEL_VERSION := 5.15
PRODUCT_ENABLE_UFFD_GC := false

# Atrace
ifneq ($(TARGET_KERNEL_VERSION),5.15)
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service
endif

## Attestation
PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ddp_dtshd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ddp_dtshd.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ddp_dtsx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ddp_dtsx.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ddp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ddp.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_default.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_dtshd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_dtshd.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_dtsx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_dtsx.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12_dtshd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12_dtshd.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12_dtsx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12_dtsx.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12v1_dtshd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12v1_dtshd.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12v1_dtsx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12v1_dtsx.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12v1.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_ms12.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_ms12.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_criterion_types.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_criterion_types.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_default_stream_volumes.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_stream_volumes.xml \
    $(LOCAL_PATH)/audio/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml

PRODUCT_PACKAGES += \
    audio_policy_engine_criteria.xml

# Parameter Framework Policy Files
PRODUCT_PACKAGES += \
    PolicyClass.xml \
    PolicySubsystem-CommonTypes.xml \
    PolicySubsystem.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/parameter-framework/ParameterFrameworkConfigurationPolicy.xml:$(TARGET_COPY_OUT_VENDOR)/etc/parameter-framework/ParameterFrameworkConfigurationPolicy.xml \
    $(LOCAL_PATH)/audio/parameter-framework/Settings/Policy/PolicyConfigurableDomains.xml:$(TARGET_COPY_OUT_VENDOR)/etc/parameter-framework/Settings/Policy/PolicyConfigurableDomains.xml \
    $(LOCAL_PATH)/audio/parameter-framework/Structure/Policy/ProductStrategies.xml:$(TARGET_COPY_OUT_VENDOR)/etc/parameter-framework/Structure/Policy/ProductStrategies.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/aml_audio_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/aml_audio_config.json

# Audio HAL Interfaces and Wrappers (No generic audio.service!)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio@7.0-util.vendor \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio.effect@7.0-util.vendor \
    android.hardware.audio.effect@7.0-impl \
    av-types-aidl-cpp.vendor \
    libaudiofoundation.vendor \
    libaudioroute.vendor \
    libaudiopolicyengineconfigurable \
    libpolicy-subsystem \
    android.media.audio.common.types-V2-cpp.vendor \
    android.hardware.bluetooth.audio-V3-ndk.vendor

## Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth.audio-impl

## Codec 2

PRODUCT_PACKAGES += \
    libcodec2_hidl@1.2.vendor \
    libcodec2_simple_component.vendor \
    libcodec2_vndk.vendor \
    libavservices_minijail.vendor \
    libstagefright_xmlparser.vendor \
    libsfplugin_ccodec_utils.vendor \
    libstagefright_bufferpool@2.0.vendor \
    libevent.vendor \
    libchrome.vendor

## Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.5-legacy \
    android.hardware.camera.provider@2.5-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    camera.device@3.3-impl \
    camera.device@3.4-impl \
    camera.device@3.5-impl \
    libexif.vendor \
    libjpeg.vendor \
    libyuv.vendor

## Cgroups
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

## Codecs
## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs_amlogic_audio_ddp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_audio_ddp.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_audio_dtshd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_audio_dtshd.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_audio_ffmpeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_audio_ffmpeg.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_encoder.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_encoder.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_performance_encoder.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_performance_encoder.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_performance_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_performance_video.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_video_ext.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_video_ext.xml \
    $(LOCAL_PATH)/media/media_codecs_amlogic_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_amlogic_video.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

## Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate-V1-ndk.vendor \
    libdumpstateutil.vendor

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer3-V2-ndk.vendor \
    android.hardware.graphics.composer@2.1.vendor \
    android.hardware.graphics.composer@2.2.vendor \
    android.hardware.graphics.common-V4-ndk.vendor \
    libdmabufheap.vendor \
    libion.vendor \
    libutilscallstack.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level-2022-03-01.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2022-03-01.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mesondisplay.cfg:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/mesondisplay.cfg \
    $(LOCAL_PATH)/configs/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg

# Health

PRODUCT_PACKAGES += \
    android.hardware.health-V1-ndk.vendor

# Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.bluetooth.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.bluetooth.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.media.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi.rc \
    $(LOCAL_PATH)/init-files/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc

PRODUCT_PACKAGES += \
    fstab.amlogic

# Gatekeeper

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper-V1-ndk.vendor \
    libtrusty.vendor \
    libgatekeeper.vendor

# HDMI
PRODUCT_PACKAGES += \
    android.hardware.tv.hdmi.cec-V1-ndk.vendor \
    android.hardware.tv.hdmi.connection-V1-ndk.vendor

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service

ifneq ($(TARGET_HAS_TEE),false)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    android.hardware.security.secureclock-V1-ndk_platform.vendor \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor \
    lib_android_keymaster_keymint_utils.vendor \
    libkeymint.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    libpuresoftkeymasterdevice.vendor \
    libshmemutil.vendor \
    libshmemcompat.vendor \
    libsoft_attestation_cert.vendor \
    libtrusty.vendor
endif

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-V1-ndk_platform.vendor

## Media firmware
#PRODUCT_COPY_FILES += \
#    kernel/amlogic/kernel-modules/media-5.4/firmware/h264_enc.bin:$(TARGET_COPY_OUT_VENDOR)/lib/firmware/video/h264_enc.bin \
#    kernel/amlogic/kernel-modules/media-5.4/firmware/video_ucode.bin:$(TARGET_COPY_OUT_VENDOR)/lib/firmware/video/video_ucode.bin

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-V1-ndk_platform.vendor

## OEM Lock
ifneq ($(TARGET_HAS_TEE),false)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

PRODUCT_PACKAGES += \
    android.hardware.oemlock@1.0.vendor
endif

## Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

## Platform
TARGET_AMLOGIC_SOC ?= s4

## Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.lineage-libperfmgr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

## Shipping API
PRODUCT_SHIPPING_API_LEVEL := 31

## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr

## SystemControl
PRODUCT_PACKAGES += \
    libsqlite.vendor

## Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor \
    android.hardware.thermal-V1-ndk.vendor \
    libjsoncpp.vendor

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.1.vendor \
    android.hardware.boot-V1-ndk.vendor \
    android.hardware.fastboot-V1-ndk.recovery \
    android.hardware.fastboot@1.0.recovery \
    android.hardware.fastboot@1.1.recovery

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    libhardware.recovery

## USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.2.vendor \
    android.hardware.usb-V2-ndk.vendor \
    android.hardware.usb.gadget-V1-ndk.vendor \
    android.frameworks.stats-V1-ndk.vendor

## VNDK
PRODUCT_PACKAGES += \
    libui_shim.vendor

## Widevine DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

## Inherit from the main common tree product makefile
$(call inherit-product, device/amlogic/common/amlogic.mk)

## Inherit from the common proprietary files makefile
$(call inherit-product, vendor/amlogic/ne-common/ne-common-vendor.mk)
