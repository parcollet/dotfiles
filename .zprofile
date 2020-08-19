# ~/.zprofile: executed by the command interpreter for login shells.

addlib () {
  if ! echo $CPATH | egrep -q "(^|:)$1/include($|:)" ; then
    export CPATH=$1/include:$CPATH
  fi
  if ! echo $LD_LIBRARY_PATH | egrep -q "(^|:)$1/lib($|:)" ; then
    export LD_LIBRARY_PATH=$1/lib:$1/lib64:$LD_LIBRARY_PATH
  fi
  if ! echo $LIBRARY_PATH | egrep -q "(^|:)$1/lib($|:)" ; then
    export LIBRARY_PATH=$1/lib:$1/lib64:$LIBRARY_PATH
  fi
  if ! echo $PKG_CONFIG_PATH | egrep -q "(^|:)$1/lib($|:)" ; then
    export PKG_CONFIG_PATH=$1/lib/pkgconfig:$PKG_CONFIG_PATH
  fi
}

addpath () {
  if ! echo $PATH | egrep -q "(^|:)$1/bin($|:)" ; then
    export PATH=$1/bin:$PATH
  fi
  if ! echo $MANPATH | egrep -q "(^|:)$1/man($|:)" ; then
    export MANPATH=$1/share/man:$MANPATH
  fi
}

addenv () {
  addlib $1
  addpath $1
}

export VISUAL=vim
export CC=clang
export CXX=clang++
#export CXXFLAGS=-Wno-c++1z-extensions

if ! echo $PATH | egrep -q "(^|:)$HOME/bin($|:)" ; then
  export PATH=$HOME/bin:$PATH
fi

export TMPDIR=/tmp

export ASAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export ASAN_OPTIONS=symbolize=1 # :detect_leaks=0

export UBSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export UBSAN_OPTIONS=symbolize=1:print_stacktrace=1:halt_on_error=0

export MSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export MSAN_OPTIONS=symbolize=1:halt_on_error=1

export CTEST_OUTPUT_ON_FAILURE=1
export TRIQS_SHOW_EXCEPTION_TRACE=1



source /Users/parcolle/triqs_install/share/cpp2pyvars.sh
source /Users/parcolle/triqs_install/share/triqsvars.sh

addlib /usr/local
addpath /usr/local/opt/llvm

