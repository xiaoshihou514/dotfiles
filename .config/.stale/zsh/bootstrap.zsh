#! /bin/zsh
dest="$HOME/.config/zsh/plugins/"
ghproxy="https://ghproxy.net/https://github.com/"
clone="git clone --depth 1"

$clone $ghproxy"zsh-users/zsh-autosuggestions" $dest"zsh-autosuggestions"
$clone $ghproxy"zsh-users/zsh-syntax-highlighting" $dest"zsh-syntax-highlighting"
$clone $ghproxy"xiaoshihou514/skiff" /tmp/skiff
cd /tmp/skiff && bash install.sh
cd -
