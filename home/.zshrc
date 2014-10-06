# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(profiles dircycle dirpersist git mess)

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.dircolors`

# beep after command
bellchar=$'\a'
setterm -blength 0 # Don't REALLY beep
zle-line-init () { echo -n "$bellchar" }
zle -N zle-line-init

export PATH="$HOME/.local/bin:$HOME/local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export CVSROOT=":pserver:mwalle@cvs:/CVSROOT"

source $HOME/.homesick/repos/homeshick/homeshick.sh

unsetopt share_history
unsetopt correct_all

# Customize to your needs...
