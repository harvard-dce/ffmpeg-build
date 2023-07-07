# ffmpeg-build

A docker image definition and a set of build scripts for creating a custom, static ffmpeg binary
for use in DCE Opencast clusters. Includes the most up-to-date versions of these codecs:

- vpx(webm)
- fdk-aac
- x264/x265
- lame
- opus

## Requirements

- Ensure you have the aws cli installed and configured correctly in your desktop,
- ability to build and run docker containers

### Example invocation

    export FFMPEG_VERSION=4.4

and then...

    make build-docker
    make build
    make package

or...

    make all

then...

    aws cp ffmpeg-4.4-static.tgz s3://[your s3 bucket]

## Contributors

* Dan Collis-Puro - [djcp](https://github.com/djcp)
* Jay Luker - [lbjay](https://github.com/lbjay)

## License

2-clause BSD. See `license.txt`.

## Copyright

2021 President and Fellows of Harvard College
