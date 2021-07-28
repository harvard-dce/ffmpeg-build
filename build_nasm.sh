#!/bin/bash

set -e

# nasm
echo "Building nasm version ${NASM_VERSION}"
curl -O -L https://www.nasm.us/pub/nasm/releasebuilds/${NASM_VERSION}/nasm-${NASM_VERSION}.tar.bz2
tar xjvf nasm-${NASM_VERSION}.tar.bz2
cd nasm-${NASM_VERSION}
./autogen.sh
./configure --prefix="$FFMPEG_BUILD_DIR" --bindir="$FFMPEG_BUILD_DIR/bin"
make
make install
