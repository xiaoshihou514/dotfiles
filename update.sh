#! /bin/bash
cp -f ~/.zshrc ~/Playground/dotfiles
cp -rf ~/.config/kitty/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/spectrwm/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/lvim/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/rofi/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/touchegg/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/skippy-xd/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/fcitx5/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/dunst/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/nvim/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/zsh/ ~/Playground/dotfiles/.config/
cp -rf ~/.config/neofetch/ ~/Playground/dotfiles/.config/
cp -rf ~/.local/share/fonts/ ~/Playground/dotfiles/.local/share/
cp -rf ~/.local/share/fcitx5/ ~/Playground/dotfiles/.local/share/
git add .
read -p "Commit message: " msg
git commit -m "${msg}" 
git push
