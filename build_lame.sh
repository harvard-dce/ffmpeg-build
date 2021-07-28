#!/bin/bash

set -e

# libmp3lame
echo "Building lame version ${LAME_VERSION}"
curl -O -L https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar xzvf lame-3.100.tar.gz
cd lame-3.100
./configure --prefix="$FFMPEG_BUILD_DIR" --bindir="$FFMPEG_BUILD_DIR/bin" --disable-shared --enable-nasm
make
make install
