# Zap plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/completions"

# Prompt
eval "$(starship init zsh)"

# Alias
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xqr='xbps-query -Rs'
alias xq='xbps-query -s'

alias grep='grep --color=auto'
alias la='ls -lah'

alias wget='wget --no-check-certificate'

# Exports
export QT_QPA_PLATFORMTHEME=qt5ct 

# Make zsh save history
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
