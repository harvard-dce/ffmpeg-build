#!/bin/bash

source ./common.sh

rm -Rf $ffmpeg_version/* ffmpeg_build/* ffmpeg_sources/*

# Build libraries
sudo aptitude install -y yasm autoconf automake build-essential libtool pkg-config texi2html

# Client codec libraries
sudo aptitude install -y libass-dev libfreetype6-dev libmp3lame-dev libogg-dev libopus-dev libsdl1.2-dev libtheora-dev libva-dev libvdpau-dev libvorbis-dev libxcb-shm0-dev libxcb-xfixes0-dev libxcb1-dev zlib1g-dev

cd $root_path/ffmpeg_sources
git clone git://git.code.sf.net/p/opencore-amr/fdk-aac
cd fdk-aac
git checkout v0.1.5
autoreconf -fiv
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --disable-shared
make && make install && make distclean

cd $root_path/ffmpeg_sources
git clone https://git.videolan.org/git/x264.git
cd x264*
git checkout "$x264_commit" -b "$x264_commit"
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --bindir="$root_path/$ffmpeg_version" --enable-static
PATH="$root_path/$ffmpeg_version:$PATH" make && make install && make distclean

cd $root_path/ffmpeg_sources
wget https://github.com/webmproject/libvpx/archive/v1.6.1.tar.gz
tar xzvf v1.6.1.tar.gz
cd libvpx-1.6.1
PATH="$root_path/$ffmpeg_version:$PATH" ./configure --prefix="$root_path/ffmpeg_build" --disable-examples --disable-unit-tests
PATH="$root_path/$ffmpeg_version:$PATH" make
make install
make clean

cd $root_path/ffmpeg_sources
wget https://ffmpeg.org/releases/${ffmpeg_version}.tar.gz
tar xvfz ${ffmpeg_version}.tar.gz

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
  --enable-runtime-cpudetect \
  --enable-version3 \
  --enable-postproc \
  --enable-avfilter \
  --enable-pthreads \
  --enable-x11grab \
  --enable-libmp3lame \
  --enable-libopenjpeg \
  --enable-bzlib \
  --enable-openal \
  --enable-libopus \
  --enable-libpulse \
  --enable-libv4l2 \
  --disable-debug
PATH="$root_path/$ffmpeg_version:$PATH" make
make install
make distclean
hash -r

