#
# User configuration sourced by all invocations of the shell
#

###############################################################################
# Zsh

# Define ZDOTDIR location
ZDOTDIR=${HOME}/.zsh.d

# Define History location
HISTFILE=${ZDOTDIR}/.zsh_history

# Define Zim location
# ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# ZIM_HOME=${ZDOTDIR:-${HOME}}/.local/share/zsh/zimfw
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

###############################################################################
# N
export N_PREFIX=$HOME/.n

###############################################################################
# Go
export GOPATH="${HOME}/Software/go"

###############################################################################
# Editor
export EDITOR=nvim

###############################################################################
# Git
export GIT_EDITOR=nvim
export GITHUB_USER="$(git config --global --includes github.user)"

##############################################################################
# You Should Use
export YSU_HARDCORE=0
export YSU_IGNORED_ALIASES=("g" "brew install" "cask install" ":q")
export YSU_IGNORED_GLOBAL_ALIASES=("...")
