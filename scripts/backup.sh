#!/bin/bash

# This script is run every day at 9:00 by craig using crontab -e
# 0 9 * * * /home/craig/minetest/minetest/worlds/server/game/scripts/backup.sh > /dev/null

# todo: use external commands mod to broadcast shutting down message to players

# message shutting down in 30 seconds
sleep 20
# message shutting down in 10 seconds
sleep 5
# message shutting down in 5 seconds
sleep 3
# message shutting down now
sleep 3

# First, shutdown the world
bash ~/minetest/minetest/worlds/server/game/scripts/shutdown.sh

# Sync world with duplicate world
rsync -azPu ~/minetest/minetest/worlds/server ~/worlds-server.bak

# Relaunch world after completion
bash ~/minetest/minetest/worlds/server/game/scripts/launch.sh

# Move world to offserver backup
DATE="date +%Y-%m-%d"
TARGET="craig@craig.zzzz.io:~/davisonio-minetest-srv1/$DATE"
rsync -azPu ~/worlds-server.bak $TARGET
