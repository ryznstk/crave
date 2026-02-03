# repo init
repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
.repo/local_manifests
device/xiaomi
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/ryznstk/device_xiaomi.git -b evo device/xiaomi/peridot

# Building 
. build/envsetup.sh
lunch lineage_peridot-bp4a-user
make installclean
m evolution
