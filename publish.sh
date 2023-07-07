#!/bin/bash

ffmpeg_version=$1
tarball="ffmpeg-${ffmpeg_version}-static.tgz"

docker run -ti --name ffmpeg_build --rm -v  ffmpegbuild

docker run -ti --name ffmpeg_build --rm -v /home/jluker/projects/ffmpeg-build/builds:/ffmpeg_build ffmpegbuild:latest

tar cvfz "$tarball" ${ffmpeg_version}/

aws s3 cp $tarball s3://$aws_asset_bucket/ --profile=$profile
