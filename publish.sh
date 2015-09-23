#!/bin/bash

source ./common.sh
tarball="${ffmpeg_version}-static.tgz"
tar cvf "$tarball" bin/

aws s3 cp $tarball s3://$aws_asset_bucket/ --profile=$profile
