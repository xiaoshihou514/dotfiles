alias ls='eza --group-directories-first --icons --git'
alias ll='ls -lhG'
alias la='ls -lahG'
alias tree='eza --git-ignore -lT --icons'
alias cat='bat -pp'
alias less='bat --paging always --style=plain'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias wget='wget --no-check-certificate'
alias curl='curl --insecure'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
if not test fd
    abbr fd 'find . -name'
end

abbr g lazygit
abbr gs 'git status'
abbr gc 'git clone'
abbr gp 'git pull'
abbr gd 'git diff'
abbr gco 'git checkout'
abbr ga 'git add -A && git commit --amend'

abbr df duf
abbr ff fastfetch
abbr gitsquash 'git reset --soft HEAD~'
abbr gitcpr 'git clone https://mirror.ghproxy.com/'
abbr wgetpr 'wget https://mirror.ghproxy.com/'

alias vim=nvim
alias vi='nvim --clean -c "set cb=unnamedplus"'
alias res='source ~/.config/fish/config.fish'
alias pip='python3 -m pip'
alias onefetch='onefetch --no-color-palette --include-hidden'
alias ytvid='yt-dlp --proxy "https://127.0.0.1:9910" -c -N 16'
alias yt='yt-dlp -x'
alias bili='bilix s -d . -vc 32 -oa'
alias kitty-fonts='kitty +list-fonts | rg -v "    " | sort | uniq'
