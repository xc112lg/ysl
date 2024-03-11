# Remove directory
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86
rm -rf build
rm -rf prebuilts/rust
# Clone rising
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
# repo sync
repo sync -c -j4 --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync
# Cloning trees
git clone https://github.com/saikrishna1504/device_mediatek_sepolicy -b udc device/mediatek/sepolicy
git clone https://github.com/saikrishna1504/kernel_xiaomi_mt6785 -b udc kernel/xiaomi/mt6785
git clone https://github.com/saikrishna1504/vendor_redmi_begonia -b udc vendor/redmi/begonia
git clone https://github.com/saikrishna1504/vendor_redmi_begonia-firmware -b udc vendor/redmi/begonia-firmware
git clone https://github.com/saikrishna1504/hardware_mediatek -b udc hardware/mediatek
git clone https://github.com/krishnaspeace/device_redmi_begonia -b rising device/redmi/begonia
git clone https://github.com/begonia-dev/android_vendor_redmi_begonia-ims -b 14.0 vendor/redmi/begonia-ims
git clone https://github.com/begonia-dev/android_packages_apps_RevampedFMRadio -b 14.0 packages/apps/MtkFMRadio
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export RISING_MAINTAINER=krishnaspeace
source build/envsetup.sh
opt_patch
# Lunch configuration
riseup begonia userdebug
# Build confriguration
make clean
ascend
