export ZSH=~/.dot_files/zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# brew path
export PATH="/usr/local/sbin:$PATH"
