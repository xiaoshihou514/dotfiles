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
alias xbps='fuzzypkg'

alias grep='grep --color=auto'
alias la='ls -lah'
alias l=ls
alias wget='wget --no-check-certificate'
alias psaux='ps -aux | grep'
alias proxy='export http_proxy='127.0.0.1:9910' && export https_proxy='127.0.0.1:9910''

alias v=/usr/bin/vi
alias vi=/usr/bin/vim
alias vim=/usr/bin/nvim
alias nvim=lvim

alias g=lazygit
alias git-config-watt-toolkit='git config --global http.sslCAInfo /etc/ssl/certs/SteamTools.Certificate.cer'

alias screenkey='screenkey --no-systray -s small -p fixed -g 10%x5%+90%+2%'
alias bottles='flatpak run com.usebottles.bottles'

# Exports
export PATH=$PATH:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin
export PATH=$PATH:~/.emacs.d/bin
fpath+=~/.config/zsh

# Make zsh save history
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Init completions
compinit
