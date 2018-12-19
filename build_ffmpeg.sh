#!/bin/bash

source ./common.sh

cd $root_path/ffmpeg_sources
wget -q https://ffmpeg.org/releases/${ffmpeg_version}.tar.gz
tar xfz ${ffmpeg_version}.tar.gz

cd ${ffmpeg_version}

PATH="$root_path/$ffmpeg_version:$PATH" PKG_CONFIG_PATH="$root_path/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$root_path/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$root_path/ffmpeg_build/include" \
  --extra-ldflags="-L$root_path/ffmpeg_build/lib" \
  --bindir="$root_path/$ffmpeg_version" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree
PATH="$root_path/$ffmpeg_version:$PATH" make
make install
make distclean
