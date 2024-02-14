
# Remove local_manifests directory
rm -rf .repo/local_manifests && \

# Clone local_manifests repository
git clone https://github.com/krishnaspeace/local_manifests --depth 1 -b main .repo/local_manifests && \

# Sync the repositories
repo sync -c -j4 --force-sync --no-clone-bundle --no-tags &&  \

# Set up build environment
source build/envsetup.sh && \

# Lunch configuration
lunch lineage_ysl-userdebug && \

# Build confriguration
make bacon
