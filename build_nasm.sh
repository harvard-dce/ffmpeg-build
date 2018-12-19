#!/bin/bash

source ./common.sh

cd $root_path/ffmpeg_sources
wget -q "https://www.nasm.us/pub/nasm/releasebuilds/${nasm_version}/nasm-${nasm_version}.tar.gz"
tar xzf "nasm-${nasm_version}.tar.gz"
cd nasm-$nasm_version
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --disable-shared
make && make install && make distclean

