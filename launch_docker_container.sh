#! /bin/bash

# This bash program is responsible for launching an docker 
# container using the values stored in the form of 
# environment variables. Following variables are used: 
# DOCKER_IMAGE_NAME 
# MAC_ADDRESS

source ~/.profile

MAC_BINDING=""
if [ -z "$MAC_ADDRESS" ];
then
	echo 'mac address is not going to be binded.';
else
	MAC_BINDING="--mac-address='$MAC_ADDRESS'"
fi

sudo docker run --name project -td -p 80:8080 -v /home/ubuntu:$(sudo docker run $DOCKER_IMAGE_NAME pwd)/work $MAC_BINDING $DOCKER_IMAGE_NAME
sudo docker exec project /bin/sh -c 'if [ -f run.sh ]; then (bash run.sh) fi' 
