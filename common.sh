#!/bin/bash

if [ -z "$ffmpeg_version" ]; then
  ffmpeg_version="ffmpeg-3.2.4"
fi

if [ -z "$aws_asset_bucket" ]; then
  aws_asset_bucket="mh-opsworks-shared-assets"
fi

if [ -z "$profile" ]; then
  profile="default"
fi

if [ -z "$x264_commit" ]; then
  # The last known working commit in x264 - this can probably be updated relatively frequently
  x264_commit="97eaef2"
fi

root_path=$(pwd)
