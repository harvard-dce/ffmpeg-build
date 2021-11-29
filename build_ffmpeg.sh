#!/bin/bash

set -e

# ffmpeg
ffmpeg_archive="ffmpeg-${FFMPEG_VERSION}.tar.bz2"
curl -O -L https://ffmpeg.org/releases/$ffmpeg_archive
tar xjvf $ffmpeg_archive
cd ffmpeg-${FFMPEG_VERSION}

PATH="$FFMPEG_BUILD_DIR/bin:$PATH" PKG_CONFIG_PATH="$FFMPEG_BUILD_DIR/lib/pkgconfig" ./configure \
  --prefix="$FFMPEG_BUILD_DIR" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$FFMPEG_BUILD_DIR/include" \
  --extra-ldflags="-L$FFMPEG_BUILD_DIR/lib" \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --bindir="$FFMPEG_BUILD_DIR/bin" \
  --enable-gpl \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-libvorbis \
  --enable-nonfree
make
make install
hash -d $FFMPEG_BUILD_DIR/bin/ffmpeg
