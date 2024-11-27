alias ls 'eza --group-directories-first --icons --git'
alias ll 'ls -lhG'
alias la 'ls -lahG'
alias tree 'eza --git-ignore -lT --icons'
alias cat 'bat -pp'
alias less 'bat --style=plain --paging=always'
alias cp 'cp -i'
alias mv 'mv -i'
alias df duf

abbr u 'cd ..'
abbr uu 'cd ../..'
abbr uuu 'cd ../../..'
abbr uuuu 'cd ../../../..'
abbr uuuuu 'cd ../../../../..'

if not test fd
    abbr fd 'find . -name'
end
if not test rg
    abbr rg "grep -Ri"
    alias grep 'grep --color=auto'
end

abbr g lazygit
abbr gs 'git status'
abbr gc 'git clone'
abbr gp 'git pull'
abbr gd 'git diff'
abbr gdl 'git diff HEAD~1 HEAD'
abbr gco 'git checkout'
abbr ga 'git add -A'
abbr gam 'git add -A && git commit --amend --no-edit'
abbr ggr 'git remote get-url origin'
abbr gsr 'git remote set-url origin'

alias vim nvim
alias vi 'nvim --clean -c "set cb=unnamedplus"'
alias vimf 'vim $(fzf) -c "if argc() == 0 | qa! | endif"'

abbr gitsquash 'git reset --soft HEAD~'
abbr gitcpr 'git clone https://mirror.ghproxy.com/'
abbr wgetpr 'wget https://mirror.ghproxy.com/'

alias ff fastfetch
alias res 'source ~/.config/fish/config.fish'
alias ytvid 'yt-dlp --proxy "https://127.0.0.1:9910" -c -N 16'
alias ytaud 'yt-dlp -x'
alias bili 'bilix s -d . -vc 32 -oa'
alias tokei 'tokei -s code'
