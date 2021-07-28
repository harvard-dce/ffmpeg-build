
ifndef FFMPEG_VERSION
$(error FFMPEG_VERSION is not set)
endif

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
tarball:=$(ROOT_DIR)/ffmpeg-$(FFMPEG_VERSION)-amazon-linux-static.tgz

all: build-docker build package

build-docker:
	docker build \
		--pull \
		-f Dockerfile \
		-t ffmpegbuild:latest \
		.

build:
	docker run \
		-ti \
		--rm \
		--name ffmpeg_build \
		-e FFMPEG_VERSION=$(FFMPEG_VERSION) \
		-v $(ROOT_DIR)/builds:/ffmpeg_build \
		ffmpegbuild:latest

package:
	rm -f $(ROOT_DIR)/package/ff* \
	&& cp -f $(ROOT_DIR)/builds/ffmpeg-$(FFMPEG_VERSION)/bin/ff* $(ROOT_DIR)/package \
	&& rm -f $(ROOT_DIR)/ffmpeg-$(FFMPEG_VERSION) \
	&& ln -s $(ROOT_DIR)/package $(ROOT_DIR)/ffmpeg-$(FFMPEG_VERSION) \
	&& tar chvzf $(tarball) -C $(ROOT_DIR) ffmpeg-$(FFMPEG_VERSION)

.PHONY: build-docker build package

clean:
	rm -rf builds/ffmpeg-*
.PHONY: clean
