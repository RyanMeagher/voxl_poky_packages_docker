# voxl_poky_packages_docker
---
this can be used to build voxl compatible packages 

### install the docker image 

`./build.sh`

this will create a docker image called `poky:voxl_packages`

### Run Image

`./voxl_build_packages.sh`

this will create a container that will ask you which packages 
you want to create. This uses a bind mount and needs ~50GB for a poky build. 

Wont work on OSX due to this [issue](https://github.com/crops/poky-container/issues/16)

after running this, built backages will be in the directory

`voxl_poky_packages_docker/build_packages` 

