#! /bin/fish

set dot $HOME/Playground/github/dotfiles
function update
    rm -rf $dot/.config/$argv
    cp -r $HOME/.config/$argv $dot/.config/
end

update fish
update kitty
update nvim_ksb

git add .
lazygit
