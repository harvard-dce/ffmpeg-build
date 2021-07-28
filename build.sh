#!/bin/bash

set -e

if [[ -z "$FFMPEG_VERSION" ]]; then
	echo "FFMPEG_VERSION is not set!"
	exit 1
fi

export FFMPEG_BUILD_DIR="/ffmpeg_build/ffmpeg-${FFMPEG_VERSION}"
export PATH=${FFMPEG_BUILD_DIR}/bin:$PATH

# https://www.nasm.us/
export NASM_VERSION=2.15.05

# http://yasm.tortall.net/Download.html
export YASM_VERSION=1.3.0

# https://github.com/mstorsjo/fdk-aac
export FDK_AAC_TAG=v2.0.2

# https://sourceforge.net/projects/lame/files/
export LAME_VERSOIN=3.100

# https://opus-codec.org/downloads/
export OPUS_VERSION=1.3.1

# https://chromium.googlesource.com/webm/libvpx.git
export LIBVPX_VERSION=v1.11.0

# NOTE: the x264/x265 libraries don't seem to have a reliable versioning
# process, so we just build from the master branch

rm -rf $FFMPEG_BUILD_DIR
mkdir -p $FFMPEG_BUILD_DIR

./build_nasm.sh
./build_yasm.sh
./build_fdk_aac.sh
./build_x264.sh
./build_lame.sh
./build_opus.sh
./build_libvpx.sh
./build_ffmpeg.sh

hash -r
