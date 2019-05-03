#!/bin/bash -e

# Install GNU ARM Embedded Toolchain, including dependencies, and add it to the path.
#
# Name                          | Location
# ----------------------------- | ----------
# lib32bz1                      | default
# lib32ncurses5                 | default
# lib32bz2-1.0                  | default
# libarchive-zip-perl           | default
# gcc-arm-none-eabi-4_9-2015q3  | /usr/local
# ------------------------------------------
#
# Author   : Jeroen de Bruijn
# Date     : 16 February 2017, 22:02
# Version  : 1.3
#
# Changelog
# Changes since v1.2
#   - Remove unnecessary sudo.
#   - Use -nv instead of --no-verbose because it looks cleaner.
#   - Don't append PATH since it is now set in the Dockerfile. Otherwise would be getting double entries.
# Changes since v1.1
#   - Just append PATH to .bashrc. The path is now also set in the Dockerfile.
# Changes since v1.0
#   - Append PATH to both .bashrc and .profile

apt-get install -y \
  lib32z1               \
  lib32ncurses5         \
  lib32bz2-1.0          \
  libarchive-zip-perl

wget -nv https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
tar xjf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
cp -R gcc-arm-none-eabi-4_9-2015q3 /usr/local/
rm -r gcc-arm-none-eabi-4_9-2015q3*

/usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/arm-none-eabi-gcc --version
