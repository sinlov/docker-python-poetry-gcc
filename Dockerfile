# This dockerfile uses extends image https://hub.docker.com/sinlov/go-micro-cli
# VERSION 1
# Author: sinlov
# dockerfile offical document https://docs.docker.com/engine/reference/builder/
# https://hub.docker.com/_/node?tab=tags&page=1&ordering=last_updated&name=15.12.0-alpine

# maintainer="https://github.com/sinlov/docker-python-poetry-gcc"

# https://hub.docker.com/r/verdaccio/verdaccio/tags?page=1&ordering=last_updated
FROM fnndsc/python-poetry:1.3.1

#USER root

RUN apt update && \
  apt install -y make gcc && \
  apt clean
