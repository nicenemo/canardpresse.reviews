#!/bin/bash
git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard
rm -rf public
rm -rf themes/ananke
git submodule update --init --recursive
