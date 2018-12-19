#!/bin/bash

source ./common.sh

cd $root_path/ffmpeg_sources
git clone git://git.code.sf.net/p/opencore-amr/fdk-aac
cd fdk-aac
git checkout $fdk_aac_tag
autoreconf -fiv
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --disable-shared
make && make install && make distclean


