#!/bin/bash

source ./common.sh

rm -Rf $ffmpeg_version/* ffmpeg_build/* ffmpeg_sources/*

# Build libraries
sudo aptitude install -y autoconf automake build-essential libtool pkg-config texi2html

# Client codec libraries
sudo aptitude install -y libass-dev libfreetype6-dev libmp3lame-dev libogg-dev libopus-dev libsdl1.2-dev libtheora-dev libva-dev libvdpau-dev libvorbis-dev libxcb-shm0-dev libxcb-xfixes0-dev libxcb1-dev zlib1g-dev

./build_nasm.sh
./build_fdk_aac.sh
./build_x264.sh
./build_libvpx.sh
./build_ffmpeg.sh

hash -r
