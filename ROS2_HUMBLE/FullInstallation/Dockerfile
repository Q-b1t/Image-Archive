ARG IMAGE=osrf/ros:humble-desktop

FROM ${IMAGE} AS ros-img

FROM ros-img AS env-setup

ARG INTERNAL_WORKSPACE=/ros2_ws

WORKDIR ${INTERNAL_WORKSPACE}

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

SHELL [ "/bin/bash" , "-c" ]

FROM env-setup AS gen-dep-install

RUN apt-get update && \
    apt install -y python3-colcon-common-extensions && \ 
    apt-get install -y make && \
    apt-get install -y g++ && \ 
    apt-get install psmisc && \
    apt-get install -y alsa-utils && \
    apt-get install -y python3-pip 

FROM gen-dep-install AS ros-dep-install

ARG ROS_DISTRO=humble

RUN apt-get install -y ros-${ROS_DISTRO}-joint-state-publisher && \
    apt-get install -y ros-${ROS_DISTRO}-joint-state-publisher-gui && \
    apt-get install -y ros-${ROS_DISTRO}-gazebo-ros && \
    apt-get install -y ros-${ROS_DISTRO}-gazebo-ros-pkgs && \
    apt-get install -y ros-${ROS_DISTRO}-joint-state-broadcaster && \
    apt-get install -y ros-${ROS_DISTRO}-joint-trajectory-controller && \
    apt-get install -y ros-${ROS_DISTRO}-controller-manager

FROM ros-dep-install AS python-libs

RUN pip3 install setuptools==58.2.0 && \
    pip3 install opencv-contrib-python==4.6.0.66 && \
    pip3 install pygame

FROM python-libs AS set_entrypoint

COPY ros_entrypoint.sh /root/.

ENTRYPOINT ["/root/ros_entrypoint.sh"]

CMD ["bash"]