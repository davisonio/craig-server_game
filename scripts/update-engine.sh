#!/bin/bash

echo -e "\n Check if required dependencies are installed, if not, install them."

sudo apt-get install git build-essential libirrlicht-dev libgettextpo0 libfreetype6-dev cmake libbz2-dev libpng12-dev libjpeg8-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-openssl-dev libluajit-5.1-dev liblua5.1-0-dev libleveldb-dev

echo -e "\n Downloading Minetest from GitHub via git..."

cd /home/craig/minetest
mkdir minetest-tmp
cd minetest-tmp
git clone https://github.com/minetest/minetest

echo -e "\n Building with cmake..."

cmake . -DENABLE_GETTEXT=1 -DENABLE_FREETYPE=1 -DENABLE_LEVELDB=1
make -j$(grep -c processor /proc/cpuinfo)
sudo make install

echo -e "\n Cleaning up and moving minetest-tmp to minetest..."

# todo

echo -e "\n Sorting out private stuff..."
# You can add/remove features from the minetest engine or add private stuff like passwords here.