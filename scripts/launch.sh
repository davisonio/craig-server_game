#!/bin/bash

# This script will launch the server and relaunch the server if it crashes.

SERVERBINDIR="/home/user/minetest/bin"
SERVERBINFILE="minetestserver"
WORLDNAME="server"
CONFIG="/home/user/minetest/games/Craig-Server_game/minetest.conf"
PORT="3000"
LOGFILE="/home/user/minetest/bin/debug.txt"

while true
	# 1 second wait
	do
	sleep 1
	# Go to the directory where minetestserver is located.
	cd $SERVERBINDIR
	# Launch it
	./$SERVERBINFILE \
		--worldname $WORLDNAME \
		--config $CONFIG \
		--port $PORT \
		--logfile $LOGFILE
done
