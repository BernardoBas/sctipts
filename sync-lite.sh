#!/bin/bash

rm -rf vendor/lineage/
rm -rf vendor/lge/
rm -rf frameworks/base/
rm -rf kernel/lge/msm8996/
rm -rf device/lge/msm8996-common/
rm -rf device/lge/h870/
rm -rf device/lge/h870ds/
rm -rf device/lge/h872/
rm -rf device/lge/us997/

repo sync --force-sync -j32 -q
source build/envsetup.sh
source scripts/repopick.sh

cd vendor/lineage/
# git remote add customizations https://github.com/BernardoBas/android_vendor_lineage.git
git fetch customizations
# NIGHTLY AND BOOTANIMATION
git cherry-pick 5bc16b3a988865cd8ce94d433fa8b5c51842a191 9bf0707c3f60042c4833fd83cec6c5ac1da9cbc3
cd ../../

cd device/lge/h870/
# git remote add fingerprint https://github.com/BernardoBas/android_device_lge_h870.git
git fetch fingerprint
# BUILD FINGERPRINT
git cherry-pick 09100a51eac9ef6321f48ce20e4bc4e80bd0fcb9
cd ../../../

cd device/lge/h872/
# git remote add fingerprint https://github.com/BernardoBas/android_device_lge_h872.git
git fetch fingerprint
# BUILD FINGERPRINT
git cherry-pick a318e00ab71d56f2a556958608c6dba7aa561fe1
cd ../../../

cd device/lge/us997/
# git remote add fingerprint https://github.com/BernardoBas/android_device_lge_us997.git
git fetch fingerprint
# BUILD FINGERPRINT
git cherry-pick 3bee4435e83a30b4abc7decd8fc0a1987ac2081a
cd ../../../

cd frameworks/base/
# git remote add camera https://github.com/BernardoBas/android_frameworks_base.git
git fetch camera
# CAM FIXES
git cherry-pick ae63d669a09fd6aa329c52f12915b34a8d372d68 382163573c199308ebc8d3706e4b9405a3455d05
cd ../../

# cd device/lge/msm8996-common/
# git remote add brightness https://github.com/BernardoBas/android_device_lge_msm8996-common.git
# git fetch brightness
# git cherry-pick 182167280f089d6cd4f29707b36bbb37f20f5ee9
# cd ../../../

# notify-send Android "Source code updated" -i /usr/share/icons/Moka/96x96/apps/android-studio.png
