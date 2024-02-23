# Remove local_manifests directory
rm -rf .repo/local_manifests
rm -rf build
# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests --depth 1 -b main .repo/local_manifests
# Clone crdroid 14
repo init --depth 1 -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
# removing failing repo 
rm -rf prebuilts/clang/host/linux-x86
rm -rf prebuilts/rust
# repo sync
repo sync -c -j14 --force-sync --no-clone-bundle --no-tags --prune
# Set up build environment
source build/envsetup.sh
# Lunch configuration
lunch lineage_ysl-userdebug
# Build confriguration
make bacon
