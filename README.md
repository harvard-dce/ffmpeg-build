# ffmpeg-build

A simple harness to build a custom ffmpeg useful to DCE for matterhorn
clusters. This includes updated vpx(webm), x264, and fdk-aac codecs.

## Requirements

* Ensure you have the aws cli installed and configured correctly in your desktop,
* vagrant

## Getting Started

Run `vagrant destroy && vagrant up`.

The provisioner will run `./build.sh` via the `./build_in_vagrant.sh` command.
If you want to customize the version of ffmpeg this compiles, edit that file
before doing the vagrant dance above. This will build in a minimal ubuntu 14.04
VM.

When this completes successfully, you'll have ffmpeg binaries compiled for
ubuntu 14.04 in the `ffmpeg-2.7.2` directory (or whatever version of ffmpeg you
chose above in the `build_in_vagrant.sh` file).

Run `./publish.sh` to create the tarball and publish to a shared asset s3
bucket. Be sure you use the same ffmpeg version string that you did in the
build config.

### Common ENV params

* `ffmpeg_version` - this should match a released ffmpeg version found
  [here](https://ffmpeg.org/releases). Defaults to `ffmpeg-2.7.2`,
* `aws_asset_bucket` - the s3 bucket that you've got permissions to publish to,
* `profile` - the profile in your [aws credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles) to use that has rights to publish to the `aws_asset_bucket`.

### Example invocations

    vagrant destroy && vagrant up
    ffmpeg_version=ffmpeg-2.7.2 aws_asset_bucket=your_bucket_name profile=default ./publish.sh

## Contributors

* Dan Collis-Puro - [djcp](https://github.com/djcp)

## See also

* https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

## License

2-clause BSD. See `license.txt`.

## Copyright

2015 President and Fellows of Harvard College
