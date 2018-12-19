#!/bin/bash

if [ -z "$ffmpeg_version" ]; then
  ffmpeg_version="ffmpeg-4.1"
fi

if [ -z "$aws_asset_bucket" ]; then
  aws_asset_bucket="mh-opsworks-shared-assets"
fi

if [ -z "$profile" ]; then
  profile="default"
fi

if [ -z "$x264_commit" ]; then
  # The last known working commit in x264 - this can probably be updated relatively frequently
  x264_commit="0a84d986"
fi

if [ -z "$nasm_version" ]; then
  nasm_version="2.14"
fi

if [ -z "$fdk_aac_tag" ]; then
  fdk_aac_tag="v2.0.0"
fi

if [ -z "$libvpx_release" ]; then
  libvpx_release="v1.7.0"
fi

root_path=$(pwd)
