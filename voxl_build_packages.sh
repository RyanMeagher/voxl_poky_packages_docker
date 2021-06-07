#!/bin/bash

docker run \
	-it \
	--rm \
	--net=host \
	--volume "$(pwd)/build_packages:/build_packages" \
	poky:voxl_packages ./setup.sh


#--mount "type=bind,src=$(pwd)/build_packages,dst=/build_packages" \