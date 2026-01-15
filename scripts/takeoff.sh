
source install/setup.bash
ros2 topic pub --once takeoff_land quadrotor_msgs/msg/TakeoffLand "{takeoff_land_cmd: 1}"

