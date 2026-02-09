# **参数要点**

## ego-planner

1、主要输入topic：odom_topic（vins输出imu里程计）、depth_topic（d430深度图640*480）、/move_base_simple/goal（rviz2选点，需要配置rviz2选点话题名称）

2、

文件single_run_in_exp.launch.py：

* map\_size ：当你的地图大小较大时需要修改，注意目标点不要超过map\_size/2
* fx/fy/cx/cy ：修改为你的深度相机的实际内参
* max\_vel/max\_acc ：修改以调整最大速度、加速度。速度建议先用0.5试飞，最大不要超过
  2.5，加速度不要超过6
* flight\_type ：1代表rviz选点模式，2代表waypoints跟踪模式
*

文件advanced\_param\_exp.launch.py：

* resolution ：代表栅格地图格点的分辨率，单位为米。越小则地图越精细，但越占内存。最
  小不要低于0.1
* obstacles\_inflation ：代表障碍物膨胀大小，单位为米。建议至少设置为飞机半径（包括
  螺旋桨、桨保）的1.5倍以上，但不要超过resolution 的4倍。如果飞机轴距较大，请相应改
  大resolution
*

## px4ctrl

文件ctrl_param_fpv.yaml：

* mass ：修改为无人机的实际重量
* hover\_percent ：修改为无人机的悬停油门，可以通过px4log查看，具体可以参考文档 如果
  你的无人机是和课程的一模一样的话，这项保持为0.3即可。如果更改了动力配置，或重量发
  生变化，或轴距发生变化，都请调整此项，否则自动起飞时会发生无法起飞或者超调严重的情
  况。
* gain/Kp,Kv ：即PID中的PI项，一般不用太大改动。如果发生超调，请适当调小。如果无人
  机响应较慢，请适当调大。
* rc\_reverse ：这项使用乐迪AT9S的不用管。如果在第十一课的自动起飞中，发现飞机的飞
  行方向与摇杆方向相反，说明需要修改此项，把相反的通道对应的值改为true。其中throttle
  如果反了，实际实验中会比较危险，建议在起飞前就确认好，步骤为：
  ros2 launch mavros px4.launch
  ros2 topic echo /mavros/rc/in
  打开遥控器，把遥控器油门从最低满满打到最高
  看echo出来的消息里哪项在缓慢变化（这项就是油门通道值），并观察它是不是由小变
  大
  如果是由小变大，则不需要修改throttle的rc\_reverse，反之改为true
  其他通道同
