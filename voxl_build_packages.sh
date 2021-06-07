#!/bin/bash

docker run \
	-it \
	--rm \
	--net=host \
	--volume "$(pwd)/build_packages:/build_packages" \
	poky:voxl_packages ./setup.sh


