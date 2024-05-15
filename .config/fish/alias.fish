alias wget='wget --no-check-certificate'
alias curl='curl --insecure'
alias ls='eza --group-directories-first --icons --git'
alias ll='ls -lhG'
alias la='ls -lahG'
alias tree='eza --git-ignore -lT'
alias bat='bat --theme="ansi"'
alias cat='bat -pp'
alias less='bat --paging always --style=plain'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'

alias gs='git status'

alias vim=nvim
alias vi='nvim --clean -c "set cb=unnamedplus"'
alias res='source ~/.config/fish/config.fish'
alias pip='python3 -m pip'
alias onefetch='onefetch --no-color-palette --include-hidden'
alias ytvid='yt-dlp --proxy "https://127.0.0.1:9910" -c -N 16'
alias yt='yt-dlp -x'
alias bili='bilix s -d . -vc 32 -oa'
alias kitty-fonts='kitty +list-fonts | rg -v "    " | sort | uniq'
abbr df duf
abbr g lazygit
abbr gitc 'git clone'
abbr gitd 'git difftool --no-symlinks --dir-diff'
abbr view 'kitty +kitten icat'
abbr ff fastfetch
abbr gitsquash 'git reset --soft HEAD~'
abbr gitcpr 'git clone https://mirror.ghproxy.com/'
abbr wgetpr 'wget https://mirror.ghproxy.com/'
