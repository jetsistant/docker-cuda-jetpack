#!/usr/bin/env bash

sudo xhost +si:localuser:root
sudo docker run --runtime nvidia -it --rm --network host -e DISPLAY=$DISPLAY \
 -v /tmp/.X11-unix/:/tmp/.X11-unix cuda-jetpack:4.2.1-devel
