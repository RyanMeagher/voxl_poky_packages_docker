FROM ubuntu:16.04

COPY setup.sh . 
RUN chmod u+x setup.sh 

#used for bind mounting 
RUN mkdir build_packages

#install yocto build dependencies
RUN apt-get update
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm

# Set up locales needed for yocto build                                                                  
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && \
					   locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
					   LANG=en_US.UTF-8 
ENV LANG en_US.utf8                                                              

# Clean up APT when done.                                                        
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*                                          


RUN git clone -b modalai-sd820-jethro https://gitlab.com/voxl-public/poky.git 

#remove so you can run as root in docker
RUN  echo "#No sanity checks" > poky/meta/conf/sanity.conf


#ENTRYPOINT ["/bin/bash", "-c", "./setup.sh"]
CMD ["bash"]

