.PHONY: test check clean dist all

TOP_DIR := $(shell pwd)

# default latest
ENV_DIST_VERSION=latest
ROOT_NAME=docker-python-poetry-gcc

# MakeDocker.mk settings start
ROOT_OWNER=sinlov
ROOT_PARENT_SWITCH_TAG := 1.7.1
# for image local build
INFO_TEST_BUILD_DOCKER_PARENT_IMAGE =fnndsc/python-poetry
INFO_BUILD_DOCKER_FILE =Dockerfile
INFO_TEST_BUILD_DOCKER_FILE =build.dockerfile
INFO_TEST_BUILD_DOCKER_CONTAINER_ARGS = bash -c "poetry --version && python -V && pip -V && echo micromamba-version && micromamba --version && gcc -v && make --version && id"
# MakeDocker.mk settings end

include z-MakefileUtils/MakeImage.mk

env: dockerEnv

all: dockerTestRestartLatest

clean: dockerTestPruneLatest

help: helpDocker
	@echo "Before run this project in docker must install docker"
