#!/bin/bash

echo -e "\n Check if required dependencies are installed, if not, install them."

sudo apt-get install git build-essential libirrlicht-dev libgettextpo0 libfreetype6-dev cmake libbz2-dev libpng12-dev libjpeg8-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-openssl-dev libluajit-5.1-dev liblua5.1-0-dev libleveldb-dev

echo -e "\n Downloading Minetest from GitHub via git..."

cd /home/craig/minetest
mkdir minetest-tmp
cd minetest-tmp
git clone https://github.com/minetest/minetest

echo -e "\n Building with cmake..."

cd minetest
cmake . -DENABLE_GETTEXT=1 -DENABLE_FREETYPE=1 -DENABLE_LEVELDB=1 -DBUILD_SERVER=1 -DBUILD_CLIENT=0
make -j$(grep -c processor /proc/cpuinfo)
sudo make install

echo -e "\n Moving minetest-tmp to minetest..."
# minetestserver
rm /home/craig/minetest/minetest/bin/minetestserver-server
mv /home/craig/minetest/minetest-tmp/minetest/bin/minetestserver /home/craig/minetest/minetest/bin/minetestserver-server
# builtin
rm -r /home/craig/minetest/minetest/builtin
mv /home/craig/minetest/minetest-tmp/minetest/builtin /home/craig/minetest/minetest/builtin
# games, mods and textures (usually not used, but hey, why not?)
rm -r /home/craig/minetest/minetest/games
mv /home/craig/minetest/minetest-tmp/minetest/games /home/craig/minetest/minetest/games
rm -r /home/craig/minetest/minetest/mods
mv /home/craig/minetest/minetest-tmp/minetest/mods /home/craig/minetest/minetest/mods
rm -r /home/craig/minetest/minetest/textures
mv /home/craig/minetest/minetest-tmp/minetest/textures /home/craig/minetest/minetest/textures

echo -e "\n Cleaning up..."
rm -rf /home/craig/minetest/minetest-tmp

echo -e "\n Sorting out private stuff..."
# You can edit things from builtin or add games, mods or textures here if you like.
