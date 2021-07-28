FROM amazonlinux:2018.03

RUN yum -y update
RUN yum install -y autoconf automake bzip2 diffutils \
	bzip2-devel cmake freetype-devel gcc gcc-c++ \
	git libtool make mercurial pkgconfig zlib-devel

RUN mkdir /ffmpeg_build
VOLUME /ffmpeg_build

WORKDIR /
COPY build*.sh ./

CMD ["./build.sh"]
