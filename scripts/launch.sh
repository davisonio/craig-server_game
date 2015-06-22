#!/bin/bash

echo -e "\n Launching the server."

while true
	# 1 second
	do
	sleep 1
	# Launch it
	cd /home/craig/minetest/minetest/bin/
	./minetestserver-server \
		--world /home/craig/minetest/minetest/worlds/server \
		--config /home/craig/minetest/minetest/worlds/server/game/minetest.conf \
		--port 30000 \
		--logfile /home/craig/minetest/logs/debug-server.txt
done &
