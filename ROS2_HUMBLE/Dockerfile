ARG IMAGE=ros:humble-ros-core

FROM ${IMAGE} AS ros-img

FROM ros-img AS env-setup

ARG INTERNAL_WORKSPACE=/ros2_ws

WORKDIR ${INTERNAL_WORKSPACE}

FROM env-setup AS dep-install

RUN apt-get update && \
    apt install -y python3-colcon-common-extensions && \ 
    apt-get install make && \
    apt-get install -y g++ && \
    apt install -y ros-humble-turtlesim && \
    apt install -y ros-humble-rqt* && \
    apt-get install -y python3-pip && \
    pip3 install setuptools==58.2.0

FROM dep-install AS set_entrypoint

COPY ros_entrypoint.sh /root/.

ENTRYPOINT ["/root/ros_entrypoint.sh"]

CMD ["bash"]