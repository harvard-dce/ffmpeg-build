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

root_path=$(pwd)
