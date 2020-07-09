###############################################################################
#
# User configuration sourced by interactive shells
#

# http://www.faqs.org/faqs/unix-faq/shell/zsh/
# https://adamspiers.org/computing/zsh/
# http://zsh.sourceforge.net/Guide/
# http://zsh.sourceforge.net/
# https://curlie.org/Computers/Software/Operating_Systems/Unix/Shell/zsh/
# http://www.zzapper.co.uk/zshtweets.html
# https://grml.org/zsh/zsh-lovers.html
# http://zshwiki.org/
# https://www.zsh.org/

# Fututre development:
# for general knowledge: https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/
# for aliases at the end: https://dev.to/thbe/enhance-your-macos-terminal-p10k-1g3m


###############################################################################
# Secrets
source $HOME/.zsh.d/.zsecrets

###############################################################################
# Debug
# set -x

###############################################################################
# Color
export TERM=xterm-256color

###############################################################################
# Path
# https://superuser.com/questions/1447936/what-is-the-difference-between-zshs-path-and-path
# Automatically remove duplicates from these arrays
typeset -U path
# array-tied-export-unique-special
export path=(
  ./bin
  ./node_modules/.bin
  ./vendor/bin
  $HOME/.local/bin
  $HOME/.composer/vendor/bin
  /usr/local/sbin
  $path
)
# scalar-tied-export-special
export PATH

# ? to include `/usr/local/opt/coreutils/libexec/gnubin` in $PATH or not to?
# ? --group-directories-first is nice, but now sort of disruptive to me

###############################################################################
# Fpath
typeset -U fpath
export fpath=(
  $fpath
)
export FPATH

##############################################################################
# Zsh

# Turn off all beeps
unsetopt BEEP

# complete_aliases breaks `z`, use full `fasd` instead
# setopt complete_aliases

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

### Is there a better way?
# Enable colors
# autoload -Uz colors

# Enable zmv
autoload -Uz zmv

# Enable ztodo
autoload -Uz ztodo

# Enable sticky-note
# autoload -Uz sticky-note

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# ignore hosts completion
zstyle ':completion:*' hosts off


##############################################################################
# Zsh IMproved FrameWork

# --------------
# zim completion
# --------------

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
# zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

# -------
# zim git
# -------

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

# ---------
# zim input
# ---------

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand no

# -------------
# zim termtitle
# -------------

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
# zstyle ':zim:termtitle' format '%n@%m: %~'

# -------
# zim ssh
# -------

# To define the identities (from ~/.ssh) to be loaded and cached on login, use:
# zstyle ':zim:ssh' ids 'id_rsa1' 'id_rsa2' 'id_rsa3'
zstyle ':zim:ssh' ids 'id_rsa'

# --------------------------------------
# zsh-users/zsh-autosuggestions with zim
# --------------------------------------

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=010'

# ------------------------------------------
# zsh-users/zsh-syntax-highlighting with zim
# ------------------------------------------

# # Set what highlighters will be used.
# # See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# # Customize the main highlighter styles.
# # See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
# typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[comment]='fg=010'

##############################################################################
# Initialize Zim Framework

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

##############################################################################
# vim: set ft=zsh: ###########################################################
##############################################################################
