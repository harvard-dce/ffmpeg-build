#!/bin/bash

source ./common.sh

cd $root_path/ffmpeg_sources
mkdir libvpx && cd libvpx
wget -q "https://chromium.googlesource.com/webm/libvpx/+archive/${libvpx_release}.tar.gz"
tar xzf "${libvpx_release}.tar.gz"
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --disable-examples --disable-unit-tests --disable-shared
PATH="$root_path/$ffmpeg_version:$PATH" make && make install && make clean
