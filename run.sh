#!/bin/bash
xhost +local:

docker run -it \
	--gpus all \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--device=/dev/video1 \
	--name=host \
	mtakeshi1222/openvslam:stable-ros-opencv \
