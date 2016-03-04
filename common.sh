#!/bin/bash

if [ -z "$ffmpeg_version" ]; then
  ffmpeg_version="ffmpeg-2.7.2"
fi

if [ -z "$aws_asset_bucket" ]; then
  aws_asset_bucket="mh-opsworks-shared-assets"
fi

if [ -z "$profile" ]; then
  profile="default"
fi

if [ -z "$x264_commit" ]; then
  # The last known working commit in x264 - this can probably be updated relatively frequently
  x264_commit="a01e339"
fi

root_path=$(pwd)
