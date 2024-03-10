# Remove directory
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86
rm -rf build
rm -rf prebuilts/rust
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b rising-begonia .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests/tree/rising-begonia
 fi
rm -rf device/redmi/begonia device/mediatek/sepolicy
# Clone rising
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
# repo sync
repo sync -c -j4 --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export RISING_MAINTAINER=krishnaspeace
source build/envsetup.sh
# Lunch configuration
lunch rising_begonia-userdebug
# Build confriguration
make clean
m ascend
