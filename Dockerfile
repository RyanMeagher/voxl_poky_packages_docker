FROM ubuntu:16.04

COPY setup.sh . 
RUN chmod u+x setup.sh 

RUN apt-get update
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm

RUN git clone -b modalai-sd820-jethro https://gitlab.com/voxl-public/poky.git

WORKDIR /poky/build 

ENTRYPOINT ["/bin/bash", "-c", "../../setup.sh"]
