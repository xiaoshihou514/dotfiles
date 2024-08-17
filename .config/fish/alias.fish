alias ls='eza --group-directories-first --icons --git'
alias ll='ls -lhG'
alias la='ls -lahG'
alias tree='eza --git-ignore -lT --icons'
alias cat='bat -pp'
alias less='bat --style=plain --paging=always'
alias cp='cp -i'
alias mv='mv -i'
alias df duf
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
if not test fd
    abbr fd 'find . -name'
end
if not test rg
    abbr rg "grep -Ri"
    alias grep='grep --color=auto'
end

abbr g lazygit
abbr gs 'git status'
abbr gc 'git clone'
abbr gp 'git pull'
abbr gd 'git diff'
abbr gco 'git checkout'
abbr ga 'git add -A && git commit --amend'
abbr grg 'git remote get-url origin'
abbr grs 'git remote set-url origin'

abbr gitsquash 'git reset --soft HEAD~'
abbr gitcpr 'git clone https://mirror.ghproxy.com/'
abbr wgetpr 'wget https://mirror.ghproxy.com/'

alias ff fastfetch
alias vim=nvim
alias vi='nvim --clean -c "set cb=unnamedplus"'
alias res='source ~/.config/fish/config.fish'
alias ytvid='yt-dlp --proxy "https://127.0.0.1:9910" -c -N 16'
alias ytaud='yt-dlp -x'
alias bili='bilix s -d . -vc 32 -oa'
