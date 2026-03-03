clear
sudo -v || exit 1
source install/setup.bash
sudo chmod 777 /dev/ttyACM0 & sleep 1;
ros2 launch realsense2_camera rs_launch.py emitter_enable:=false enable_depth:=true enable_infra1:=true   enable_infra2:=true   depth_module.depth_profile:=640x480x30   depth_module.infra_profile:=640x480x30 & sleep 3;
ros2 launch mavros px4.launch & sleep 3;
ros2 run vins vins_node ./src/Fast-Drone-250-ROS2/VINS-Fusion-ROS2/config/realsense_d435i/realsense_stereo_imu_config.yaml
wait;

