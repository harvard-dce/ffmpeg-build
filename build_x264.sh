#!/bin/bash

set -e

# libxh264
git clone --depth 1 https://code.videolan.org/videolan/x264
cd x264
PKG_CONFIG_PATH="$FFMPEG_BUILD_DIR/lib/pkgconfig" ./configure --prefix="$FFMPEG_BUILD_DIR" --bindir="$FFMPEG_BUILD_DIR/bin" --enable-static
make
make install

# libx265
git clone https://github.com/videolan/x265
cd x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$FFMPEG_BUILD_DIR" -DENABLE_SHARED:bool=off ../../source
make
make install
