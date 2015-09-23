# static-ffmpeg-build

A simple harness to build a custom ffmpeg useful to DCE for matterhorn
clusters.

## Requirements

* Ensure you have the aws cli installed and configured correctly,
* Runs on debian jessie (and probably ubuntu 14.04).

## Getting Started

Run `./build.sh`. `ffmpeg` will be statically compiled into `./bin`.

Run `./publish.sh` to create the tarball and publish to a shared asset s3
bucket.

### Common ENV params

* `ffmpeg_version` - this should match a released ffmpeg version found
  [here](https://ffmpeg.org/releases). Defaults to `ffmpeg-2.7.2`,
* `aws_asset_bucket` - the s3 bucket that you've got permissions to publish to,
* `profile` - the profile in your [aws credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles) to use that has rights to publish to the `aws_asset_bucket`.

### Example invocations

    ffmpeg_version=ffmpeg-2.7.2 aws_asset_bucket=your_bucket_name profile=default ./build.sh
    ffmpeg_version=ffmpeg-2.7.2 aws_asset_bucket=your_bucket_name profile=default ./publish.sh

## Contributors

* Dan Collis-Puro - [djcp](https://github.com/djcp)

## See also

* https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

## License

2-clause BSD. See `license.txt`.

## Copyright

2015 President and Fellows of Harvard College
