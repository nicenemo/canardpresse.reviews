#!/bin/bash
git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard
