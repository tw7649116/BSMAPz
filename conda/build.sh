#!/bin/bash

export CPATH=$CPATH:${CONDA_PREFIX}/include
export LDFLAGS="$LDFLAGS -L${CONDA_PREFIX}/lib"
#export CPPFLAGS="-I$CONDA_PREFIX/include"
export LIBRARY_PATH="$LIBRARY_PATH:${CONDA_PREFIX}/lib"

samtools help
#make AR=$AR LD=$LD CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS -L${CONDA_PREFIX}/lib" CXXFLAGS="$CXXFLAGS" CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" LIBPATH="$LDFLAGS" -C samtools
make AR="$AR cr" LD=$LD CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS -L. -lgzstream -lz" LIBPATH="$LDFLAGS" -C gzstream
#make AR=$AR LD=$LD CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" FLAGS="-L${CONDA_PREFIX}/lib"
make AR=$AR LD=$LD CC="$CC" CXX="$CXX" CFLAGS="$CFLAGS -L${CONDA_PREFIX}/lib" CXXFLAGS="$CXXFLAGS" CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" FLAGS="-L${CONDA_PREFIX}/lib"
make test
make DESTDIR=${PREFIX} install
