#!/bin/bash
docker build . -t sessions-builder:latest
docker run --rm --volume "$(pwd)/build:/book/build" sessions-builder:latest
