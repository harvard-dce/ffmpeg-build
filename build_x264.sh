#!/bin/bash

source ./common.sh

cd $root_path/ffmpeg_sources
git clone https://git.videolan.org/git/x264.git
cd x264*
git checkout "$x264_commit" -b "$x264_commit"
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --bindir="$root_path/$ffmpeg_version" --enable-static
PATH="$root_path/$ffmpeg_version:$PATH" make && make install && make distclean

