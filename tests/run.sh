#!/bin/bash

docker build . -t cat_test:1.0 -f tests/Dockerfile
docker run cat_test:1.0
