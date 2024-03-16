# Remove directory
rm -rf prebuilts/clang/host/linux-x86
rm -rf build
rm -rf prebuilts/rust
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests.git --depth 1 -b evo .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/krishnaspeace/local_manifests.git
# Initialize evo repository
repo init -u https://github.com/Evolution-X/manifest -b udc
# repo sync
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
# fixing fingerprint
rm -rf vendor/fingerprint/opensource/interfaces
git clone https://github.com/xiaomi-msm8953-devs/android_vendor_fingerprint_opensource_interfaces vendor/fingerprint/opensource/interfaces
# Set up build environment
export BUILD_USERNAME=kr
export BUILD_HOSTNAME=crave
export EVOLUTION_MAINTAINER=krishnaspeace
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
source build/envsetup.sh
# Lunch configuration
lunch evolution_ysl-userdebug
# Build confriguration
make installclean
m evolution
