alias cp 'cp -i'
alias mv 'mv -i'
alias df duf

if type -q eza then
    alias ls 'eza --group-directories-first --icons --git'
    alias tree 'eza --git-ignore -lT --icons'
    alias ll 'ls -lh'
    alias la 'ls -lah'
else
    alias ll 'ls -lh'
    alias la 'ls -lah'
end

if type -q bat || type -q batcat then
    if type -q batcat then
        alias bat batcat
    end
    alias cat 'bat -pp'
    alias less 'bat --style=plain --paging=always'
end

abbr u 'cd ..'
abbr uu 'cd ../..'
abbr uuu 'cd ../../..'
abbr uuuu 'cd ../../../..'
abbr uuuuu 'cd ../../../../..'

if type -q fdfind then
    alias fd fdfind
end
if not type -q fd
    abbr fd 'find . -name'
end
if not type -q rg
    abbr rg "grep -Ri"
    alias grep 'grep --color=auto'
end

if type -q flutter then
    abbr pub 'flutter pub'
    abbr fl flutter
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
alias visudo 'sudo (which nvim) --clean -c "set cb=unnamedplus"'

abbr gitsquash 'git reset --soft HEAD~'
abbr gitcpr 'git clone https://mirror.ghproxy.com/'
abbr wgetpr 'wget https://mirror.ghproxy.com/'

alias ff fastfetch
alias res 'source ~/.config/fish/config.fish'
alias ytvid 'yt-dlp --proxy "https://127.0.0.1:9910" -c -N 16'
alias ytaud 'yt-dlp -x'
alias bili 'bilix s -d . -vc 32 -oa'
alias tokei 'tokei -s code'
alias tokeipie 'tokei -o json | tokei-pie'
