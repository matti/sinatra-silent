#!/usr/bin/env sh
set -e

docker build -t sinatra_silent .
docker run -it sinatra_silent rake
