#!/bin/bash

set -e

# yasm
echo "Building yasm version ${YASM_VERSION}"
curl -O -L http://www.tortall.net/projects/yasm/releases/yasm-${YASM_VERSION}.tar.gz
tar xzvf yasm-${YASM_VERSION}.tar.gz
cd yasm-${YASM_VERSION}
./configure --prefix="$FFMPEG_BUILD_DIR" --bindir="$FFMPEG_BUILD_DIR/bin"
make
make install
