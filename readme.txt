quickstart
if you connected camera to video1
chmod 777 install-usbcam.sh install-host.sh ros-dev.sh
./install-usbcam.sh
./install-host.sh
./ros-dev.sh

how to use

terminal 1
hostname -i
export ROS_MASTER_URI=http://hostIP:11311
export ROS_IP=hostIP

terminal 2 (docker1)
xhost +local:
docker exec -it usb-cam /bin/bash
hostname -i
export ROS_MASTER_URI=http://hostIP:11311
export ROS_IP=docker1IP
roslaunch /openvslam/ros/src/usb_cam-test.launch

terminal 3
hostname -i
export ROS_MASTER_URI=http://hostIP:11311
export ROS_IP=hostIP
rosrun image_transport republish raw in:=/usb_cam/image_raw raw out:=/camera/image_raw

terminal 4 (docker2)
xhost +local:
docker exec -it host /bin/bash
hostname -i
export ROS_MASTER_URI=http://hostIP:11311
export ROS_IP=docker2IP
rosrun openvslam run_slam -v /openvslam/build/orb_vocab/orb_vocab.dbow2 -c /openvslam/build/5500s.yaml

Follow CameraをON/OFFしてみる
pointcloudが確認できたらOK

