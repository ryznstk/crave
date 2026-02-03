# repo init
repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
.repo/local_manifests
device/xiaomi/peridot
out/target/product/peridot
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/ryznstk/manifest_peridot.git -b lineage-23.0 .repo/local_manifests/

# Building 
. build/envsetup.sh
lunch lineage_peridot-bp4a-user
make installclean
m evolution
