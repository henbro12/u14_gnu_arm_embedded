#!/bin/bash -e

# Install Boost and add it to the path.
#
# Author   : Jeroen de Bruijn
# Date     : 19 March 2017, 16:16
# Version  : 1.2
#
# Changelog
# Changes since v1.1
#   - Use -nv instead of --no-verbose because it looks cleaner.
#   - Don't append PATH since it is now set in the Dockerfile. Otherwise would be getting double entries.
# Changes since v1.0
#   - Just append BOOST_ROOT to .bashrc. The path is now also set in the Dockerfile.

boost_version=1.63.0
boost_name=boost_1_63_0

wget -nv https://sourceforge.net/projects/boost/files/boost/$boost_version/$boost_name.tar.gz
tar xfz $boost_name.tar.gz
rm $boost_name.tar.gz
cd $boost_name
./bootstrap.sh --prefix=/usr/local/$boost_name
./b2 install
cd .. && rm -r $boost_name
