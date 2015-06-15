#!/bin/bash

echo -e "\n Restarting the server."

# This shuts down the server (but it will go back up thanks to launch.sh)
killall -INT minetestserver-server
