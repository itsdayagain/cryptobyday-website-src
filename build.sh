#!/bin/sh

# Builds the website and applies post processing, storing the final output in
# `build-output/`.

hugo build --cleanDestinationDir
mkdir build-output
rm -r build-output/*
ln -s ../build-git build-output/.git
cp -r build-base/* build-output/
cp -r public/* build-output/

# Make output HTML pretty
find build-output -path "*.html" -type f \
  -exec tidy --quiet yes --indent yes --indent-spaces 2 --wrap 0 --tidy-mark no -o {} {} \;