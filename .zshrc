# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
export  VIRTUAL_ENV_DISABLE_PROMPT=1
#source $HOME/.mypython/bin/activate
#
export PROMPT='Mac:%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)'

export PATH=/usr/local/bin/:$HOME/triqs/BUILD/triqs/INSTALL_DIR/bin:$PATH
#source $HOME/.mypython/bin/activate

cmake_invoke () {
  cmake ~/src/$1 -DTRIQS_PATH=$PWD/../triqs/INSTALL_DIR -Wno-dev
}

#export LANG=fr_FR.UTF-8
#export LC_ALL=fr_FR.UTF-8

alias return_code="echo $?"
alias dm8='make -j8 2>&1|less -R'
alias dmake='make 2>&1 | sed -e "s/triqs::gfs:://g" | sed -e "s/triqs::clef:://g" |sed -e "s/triqs:://g" |less -R'
alias grep='grep --color=auto'
alias l='ls -l'
alias la='ls -Al'
alias lk='ls -lSr'
alias ll='ls -l'
alias lm='ls -al |more'
alias lr='ls -lR'
alias ls='ls -hFG '
alias lt='ls -ltr'
alias lx='ls -lXB'
alias m8='make -j8'
alias m8test='make -j8 && make test'
alias m8docinstall='make -j8 && make -j8 install 2>&1 >/dev/null'
alias maek='make'
alias mroe='more'
alias print_code='enscript -G -f Courier7 -Pko '
alias print_code_CPP='enscript -G -f Courier7  --color -Ecpp -L 90 -C '
alias print_code_PY='enscript -G -f Courier7  --color -Epython -L 90 -C '
alias rm='rm -f'
alias voirCPP='find . -name "*.?pp" |xargs grep -nH '
alias voirHPP='find . -name "*.hpp" |xargs grep -nH '
alias voirMake='find . -name "*.cmake" -or -name "CMakeLists.txt" |xargs grep -nH '
alias voirPY='find . -name "*.py" -or -name "*.pxd" -or -name "*.pyx" |xargs grep -nH '
alias voirRST='find . -name "*.rst" |xargs grep -nH '
alias mvim='mvim -p'
alias make_doc="make -j8 && make -j8 install 2>&1 >/dev/null"

#alias clang-format="/opt/llvm/bin/clang-format"
#alias clang-format="/usr/local/Cellar/llvm/3.9.1/bin/clang-format"

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"


# temp
#alias cmake="/Applications/CMake.app/Contents/bin/cmake"
#alias ccmake="/Applications/CMake.app/Contents/bin/ccmake"
##export HDF5_DEBUG="all"

#export PATH=$PATH:/usr/local/Cellar/llvm/3.9.1/bin

export HOMEBREW_GITHUB_API_TOKEN=""

#export LIBCLANG_LOCATION="/usr/local/lib/libclang.dylib"
#export LIBCLANG_CXX_ADDITIONAL_FLAGS=" -I/usr/local/Cellar/llvm/4.0.0/bin/../include/c++/v1 -I/usr/local/Cellar/llvm/4.0.0/bin/../include/c++/v1 -I/usr/local/include -I/usr/include -I/System/Library/Frameworks -I/Library/Frameworks"

export TMPDIR=/tmp
export CTEST_OUTPUT_ON_FAILURE=1

source /Users/oparcollet/triqs_install/share/cpp2pyvars.sh
source /Users/oparcollet/triqs_install/share/triqsvars.sh
export LIBRARY_PATH=/usr/local/opt/llvm/lib:$LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/usr/local/include:/Users/oparcollet/triqs_install/include:$CPLUS_INCLUDE_PATH

#Do NOT share history
unsetopt share_history
#
#
tagsrc () {
   list=()
   file_endings=(c cpp h hpp)
   for j in ${file_endings[@]}; do
      for i in $@; do
         list+=($i/**/*.$j(N))
      done
   done
   ctags ${list[@]}
}

