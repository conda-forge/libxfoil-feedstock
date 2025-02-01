#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

mkdir build -p
cd build 

export FFLAGS="${FFLAGS} -fallow-argument-mismatch"
cmake -D CMAKE_BUILD_TYPE:STRING=Release \
      -D CMAKE_PREFIX_PATH:FILEPATH=${PREFIX} \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=${PREFIX} \
      ..

make install

cd ..

${PYTHON} setup.py build_ext
${PYTHON} setup.py install
