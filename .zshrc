# Zap plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
zapplug "zap-zsh/supercharge"
zapplug "zsh-users/zsh-autosuggestions"
zapplug "zsh-users/zsh-syntax-highlighting"
zapplug "hlissner/zsh-autopair"
zapplug "zap-zsh/vim"

# Prompt
eval "$(starship init zsh)"

# Alias
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xqr='xbps-query -Rs'
alias xq='xbps-query -s'

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -lah'
