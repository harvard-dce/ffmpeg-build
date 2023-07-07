#!/bin/bash

set -e

# libmp3lame
echo "Building lame version ${LAME_VERSION}"
curl -O -L https://downloads.sourceforge.net/project/lame/lame/${LAME_VERSION}/lame-${LAME_VERSION}.tar.gz
tar xzvf lame-${LAME_VERSION}.tar.gz
cd lame-${LAME_VERSION}
./configure --prefix="$FFMPEG_BUILD_DIR" --bindir="$FFMPEG_BUILD_DIR/bin" --disable-shared --enable-nasm
make
make install
