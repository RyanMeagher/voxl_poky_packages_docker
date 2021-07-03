#!/bin/bash 
MOUNT_DIR=build_packages
POKY_DIR=/${MOUNT_DIR}/poky

#clean up incase user exited docker early on previous run
rm -rf /build_packages/poky 
mv /poky /$MOUNT_DIR/

cd /$MOUNT_DIR/poky
source oe-init-build-env

cp $POKY_DIR/modalai/local.conf $POKY_DIR/build/conf/
echo "WARN_QA_remove = "host-user-contaminated"" >> $POKY_DIR/build/conf/local.conf

read -p 'package names you want installed seperated by a space: ' package_list 

for package in $package_list; do
	echo "IMAGE_INSTALL_append = \" ${package}\"" >> $POKY_DIR/build/conf/local.conf;
done

echo "[INFO] building packages "
bitbake core-image-full-cmdline
echo "[COMPLETED] build packages located at /poky/build/tmp/deploy/ipk/aarch64"

mv $POKY_DIR/build/tmp/deploy/ipk/aarch64/* /$MOUNT_DIR/
echo "[COMPLETED] packages moved to build_packages directory on hostOS"

rm -rf $POKY_DIR

