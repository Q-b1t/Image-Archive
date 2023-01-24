#!/bin/bash
cat /opt/ros/humble/lib/controller_manager/spawner >> spawner.py 

cat /opt/ros/humble/lib/controller_manager/unspawner >> unspawner.py 

chmod u+x spawner.py unspawner.py
