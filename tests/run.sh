#!/bin/bash

#cd ../
docker build . -t cat_grep_test:1.0 -f tests/Dockerfile
docker run cat_grep_test:1.0
