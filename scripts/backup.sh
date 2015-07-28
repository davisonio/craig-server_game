#!/bin/bash

# This script is run every day at 9:00 by craig using crontab -e
# 0 9 * * * /home/craig/minetest/minetest/worlds/server/game/scripts/backup.sh > /dev/null

echo "In 20 seconds, the server will shut-down for daily backups." > ~/minetest/minetest/worlds/server/message
sleep 5
echo "You will be able to rejoin the world shortly afterwards." > ~/minetest/minetest/worlds/server/message
sleep 10
echo "Server shutting down in 5 seconds..." > ~/minetest/minetest/worlds/server/message
sleep 5
echo "Server shutting down now!" > ~/minetest/minetest/worlds/server/message
sleep 2

# First, shutdown the world
bash ~/minetest/minetest/worlds/server/game/scripts/shutdown.sh

# Sync world with duplicate world
rm -rf ~/worlds-server.bak
cp -r ~/minetest/minetest/worlds/server ~/worlds-server.bak

# Relaunch world after completion
echo "Relaunching world"
nohup bash ~/minetest/minetest/worlds/server/game/scripts/launch.sh &

# Move world to off-site backup
echo "Move world to off-site backup"
rsync -azP ~/worlds-server.bak craig@craig.zzzz.io:~/davisonio-minetest-srv1/`date +%Y-%m-%d` &
