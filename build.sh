# repo init
repo init -u https://github.com/VoltageOS/manifest.git -b 16.2 --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
vendor/lineage-priv/keys
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/ryznstk/device_xiaomi.git -b vos device/xiaomi/peridot

# My Keys
git clone https://github.com/droidcore/private_key.git vendor/lineage-priv/keys

# Building 
. build/envsetup.sh
export BUILD_USERNAME=BLU
export BUILD_HOSTNAME=ubuntu
make installclean
brunch peridot
