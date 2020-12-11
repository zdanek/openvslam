#!/bin/bash
docker load -i usbcam.tar

docker run -it \
	--gpus all \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--device=/dev/video1 \
	--name=usbcam \
	openvslam:usbcam 

exit

