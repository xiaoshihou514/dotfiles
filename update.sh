#! /bin/bash
cp -f ~/.zshrc ~/Playground/dotfiles
cp -rf ~/.config/kitty/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/spectrwm/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/lvim/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/rofi/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/touchegg/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/dunst/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/skippy-xd/ ~/Playground/dotfiles/.config/
git add .
read -p "Commit message: " msg
git commit -m "${msg}" 
git push
