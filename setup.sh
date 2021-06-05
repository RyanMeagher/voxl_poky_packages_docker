#!/bin/bash 

cd /poky
source oe-init-build-env

cp /poky/modalai/local.conf /poky/build/conf/

read -p 'package names you want installed seperated by a space: ' package_list 

for package in $package_list; do
	echo "IMAGE_INSTALL_append = \" ${package}\"" >> /poky/build/conf/local.conf;
done

echo "[INFO] building packages "
bitbake core-image-full-cmdline
echo "[COMPLETED] build packages located at /poky/build/tmp/deploy/ipk/aarch64"

mv /poky/build/tmp/deploy/ipk/aarch64 /build_packages
echo "[COMPLETED] packages moved to build_packages directory on hostOS"

