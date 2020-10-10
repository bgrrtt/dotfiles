###############################################################################
#
# User configuration sourced by interactive shells
#
###############################################################################

###############################################################################
# Secrets
source $ZDOTDIR/.zsecrets

###############################################################################
# Path
typeset -U path
export path=(
    ./bin
    ./node_modules/.bin
    ./vendor/bin
    $HOME/.local/bin
    $path
)
export PATH

###############################################################################
# Fpath
typeset -U fpath
export fpath=(
    $ZDOTDIR/functions
    $fpath
)
export FPATH

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

###############################################################################
# Zsh

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Fix backspace when using vi mode
# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
bindkey "^?" backward-delete-char

# Enable blah
autoload -U blah

# Enable zmv
autoload -Uz zmv

# Enable ztodo
autoload -Uz ztodo
chpwd() { ztodo }

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# ignore hosts completion
zstyle ':completion:*' hosts off

# Define History location
export HISTFILE=$ZDOTDIR/.zhistory

# setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
# setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY          # Share history between all sessions.
# setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
# setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
# setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
# setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
# setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
# setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
# setopt APPEND_HISTORY         # append to history file
# setopt HIST_NO_STORE          # Don't store history commands

# -----------------------------------------------------------------------------
# Zimfw

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

# To define the identities (from ~/.ssh) to be loaded and cached on login, use:
# zstyle ':zim:ssh' ids 'id_rsa1' 'id_rsa2' 'id_rsa3'
zstyle ':zim:ssh' ids 'id_rsa'

# Initialize modules
if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

##############################################################################
# Keybindings
# configured with bgrrtt/zimfw-keybindings in the Zim Framework initialization

##############################################################################
# Aliases
# configured with bgrrtt/zimfw-aliases in the Zim Framework initialization

###############################################################################
###############################################################################

# Remove zsh completion shipped with Homebrew git.
# https://github.com/Homebrew/homebrew-core/issues/33275
[[ -f /usr/local/share/zsh/site-functions/_git ]] && \
  rm  -f /usr/local/share/zsh/site-functions/_git
