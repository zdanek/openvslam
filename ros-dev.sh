#!/bin/bash
xhost +local:

gnome-terminal -- bash -c "export ROS_MASTER_URI=http://172.17.0.1:11311 ;export ROS_IP=172.17.0.1 ;roscore"
sleep 2
gnome-terminal -- bash -c "docker start usb-cam; docker exec -it usb-cam /bin/bash ; bash"
#gnome-terminal -- bash -c "sleep 2 ;rviz; bash"
sleep 2

#gnome-terminal -- bash -c "export ROS_MASTER_URI=http://172.17.0.1:11311 ;export ROS_IP=172.17.0.1 ;rosrun image_transport republish raw in:=/video/image_raw raw out:=/camera/image_raw"

gnome-terminal -- bash -c "export ROS_MASTER_URI=http://172.17.0.1:11311 ;export ROS_IP=172.17.0.1 ;rosrun image_transport republish raw in:=/usb_cam/image_raw raw out:=/camera/image_raw"
#sleep 1
sleep 1
gnome-terminal -- bash -c "docker start host; docker exec -it host /bin/bash ; bash"

#export ROS_MASTER_URI=http://172.17.0.1:11311
#export ROS_IP=172.17.0.1
#roscore

