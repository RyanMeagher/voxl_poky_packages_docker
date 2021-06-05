#!/bin/bash 

chmod u+x voxl_build_packages.sh

if [[ $(which docker) && $(docker --version) ]]; then
    echo "[INFO] docker is installed on host"
    echo "[INFO] building docker image to make packages for voxl " 

    docker build -t poky:voxl_packages -f voxl_build_packages.Dockerfile .
    
    echo "[SUCCESSFULLY BUILT]"
    echo "[RUN] ./voxl_build_packages.sh" 
	
else
    echo "Install docker"
    exit 1
fi