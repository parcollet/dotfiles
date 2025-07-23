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


source $HOME/.venv/my_python/bin/activate

export PATH=/Users/oparcollet/.venv/my_python/bin:$PATH

# Cf brew info llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"


export VISUAL=vim
export CC=clang
export CXX=clang++
#export CXXFLAGS=-Wno-c++1z-extensions

if ! echo $PATH | egrep -q "(^|:)$HOME/bin($|:)" ; then
  export PATH=$HOME/bin:$PATH
fi

export TMPDIR=/tmp
export CTEST_OUTPUT_ON_FAILURE=1

addpath /usr/local/opt/llvm

export SDKROOT=$(xcrun --show-sdk-path)

# Sanitizers
export ASAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export ASAN_OPTIONS=symbolize=1:detect_leaks=0 # fast_unwind_on_malloc=0
export UBSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export UBSAN_OPTIONS=symbolize=1:print_stacktrace=1:halt_on_error=1
export TSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export TSAN_OPTIONS=symbolize=1:halt_on_error=1
export MSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)
export MSAN_OPTIONS=symbolize=1:halt_on_error=1

##
# Your previous /Users/oparcollet/.zprofile file was backed up as /Users/oparcollet/.zprofile.macports-saved_2024-01-23_at_23:26:55
##

# MacPorts Installer addition on 2024-01-23_at_23:26:55: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2024-01-23_at_23:26:55: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

