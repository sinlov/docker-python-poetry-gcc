.PHONY: test check clean dist all

TOP_DIR := $(shell pwd)

# default latest
ENV_DIST_VERSION=latest
ROOT_NAME=docker-python-poetry-gcc

# MakeDocker.mk settings start
ROOT_OWNER=sinlov
ROOT_PARENT_SWITCH_TAG := 1.3.1
# for image local build
INFO_TEST_BUILD_DOCKER_PARENT_IMAGE=fnndsc/python-poetry
INFO_BUILD_DOCKER_FILE=Dockerfile
INFO_TEST_BUILD_DOCKER_FILE=Dockerfile.s6
# MakeDocker.mk settings end

ROOT_BUILD_OS := alpine

include z-MakefileUtils/MakeImage.mk
include z-MakefileUtils/MakeImageSlim.mk

all: dockerTestRestartLatest

clean: dockerTestPruneLatest

help: helpDocker
	@echo "Before run this project in docker must install docker"
