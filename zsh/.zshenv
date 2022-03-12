###############################################################################
#
# User configuration sourced by all invocations of the shell
#
###############################################################################

# See `man zsh`'s "STARTUP/SHUTDOWN FILES" and "FILES"

###############################################################################
# Env

#
# DO NOT INCLUDE PATH OR FAPTH
# https://unix.stackexchange.com/questions/555473/path-setup-in-zsh-in-os-x
# macOS reads /etc/zshrc after ~/.zshenv, which may overwrite configuration.
# macOS reads /etc/zprofile after /etc/zshrc, which contains a PATH "helper".
#    Set PATH and FPATH in ZDOTDIR/.zshrc

###############################################################################
# Zsh

# DO NOT LOAD GLOBAL_RCS FROM /etc
setopt NO_GLOBAL_RCS

# Define ZDOTDIR location
ZDOTDIR=${HOME}/.zsh.d

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
