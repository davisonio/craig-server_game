#!/bin/bash

echo -e "\n Deleting game folder..."

rm -rfd /home/craig/minetest/minetest/worlds/server/game/

echo -e "\n Downloading game from GitHub via git..."

cd /home/craig/minetest/minetest/worlds/server/
git clone https://github.com/CraigyDavi/Craig-Server_game
mv /home/craig/minetest/minetest/worlds/server/Craig-Server_game /home/craig/minetest/minetest/worlds/server/game

echo -e "\n Sorting out private stuff..."
# You can add/remove mods from the game or add private stuff like passwords here

echo -e "\n Done!"
