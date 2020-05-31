#
# User configuration sourced by all invocations of the shell
#

# Define ZDOTDIR location
ZDOTDIR=${HOME}/.zsh.d

# Define History location
HISTFILE=${ZDOTDIR}/.zsh_history

# Define Zim location
# ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# ZIM_HOME=${ZDOTDIR:-${HOME}}/.local/share/zsh/zimfw
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
