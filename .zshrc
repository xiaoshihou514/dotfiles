# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/Applications/nvim-linux64/bin"
export PATH=$PATH:"$HOME/.local/share/nvim-main/mason/bin"
export PATH=$PATH:"$HOME/.luarocks/bin"

# Setup programs
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
# zoxide
eval "$(zoxide init zsh)"
# Prompt
eval "$($HOME/.local/bin/skiff init)"
# fzf cmd history
source /usr/share/fzf/shell/key-bindings.zsh
# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

ZSH_CONF="/home/xiaoshihou/.config/zsh"
ZSH_PLUGIN="$ZSH_CONF/plugins"

# Plugins
source "$ZSH_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"         # zsh-users/zsh-autosuggestions
source "$ZSH_PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" # zsh-users/zsh-syntax-highlighting

# local setup
source "$ZSH_CONF/options.zsh"
source "$ZSH_CONF/alias.zsh"
source "$ZSH_CONF/functions.zsh"
source "$ZSH_CONF/keys.zsh"
source "$ZSH_CONF/completions.zsh"
source "$ZSH_CONF/private.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
