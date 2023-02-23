#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash --
exec "$@"