#!/bin/bash

set -e

# libopus
echo "Building opus version ${OPUS_VERSION}"
curl -O -L https://archive.mozilla.org/pub/opus/opus-${OPUS_VERSION}.tar.gz
tar xzvf opus-${OPUS_VERSION}.tar.gz
cd opus-${OPUS_VERSION}
./configure --prefix="$FFMPEG_BUILD_DIR" --disable-shared
make
make install
