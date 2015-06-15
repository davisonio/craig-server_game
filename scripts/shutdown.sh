#!/bin/bash

echo -e "\n Shutting down the server."

# This kills the launch script so it doesn't think the server has crashed
pkill -f launch.sh

# This shuts down the server
killall -INT minetestserver-server
