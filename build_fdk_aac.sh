#!/bin/bash

set -e

# libfdk_aac
echo "Building fdk-aac version ${FDK_AAC_TAG}"
git clone -b ${FDK_AAC_TAG} --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="$FFMPEG_BUILD_DIR" --disable-shared
make
make install
