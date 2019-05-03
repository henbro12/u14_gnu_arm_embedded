#!/bin/bash -e

# Install Doxygen, including dependencies, and add it to the path.
#
# Name                          | Location
# ----------------------------- | ----------
# graphviz                      | default
# doxygen-1.8.13                | /usr/local
# ------------------------------------------
#
# Author   : Jeroen de Bruijn
# Date     : 18 February 2017, 16:49
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

doxygen_version=1.8.15

apt-get install -y \
  graphviz

wget -nv http://doxygen.nl/files/doxygen-$doxygen_version.src.tar.gz
tar xf doxygen-$doxygen_version.linux.bin.tar.gz
rm doxygen-$doxygen_version.linux.bin.tar.gz
cp -R doxygen-$doxygen_version /usr/local/
rm -r doxygen-$doxygen_version

/usr/local/doxygen-$doxygen_version/bin/doxygen --version
dot -V
