# Path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/Applications/nvim-nightly/bin
fish_add_path $HOME/Applications/lua_ls/bin
fish_add_path $HOME/Applications/stylua-linux
fish_add_path $HOME/.luarocks/bin
fish_add_path $HOME/Applications/detekt-cli-1.23.3/bin
fish_add_path $HOME/Applications/flutter/bin
fish_add_path $HOME/Applications/android_sdk/cmdline-tools/latest/bin
fish_add_path $HOME/.local/share/coursier/bin
fish_add_path $HOME/Applications/zig-13/
fish_add_path $HOME/Applications/idea-IU-242.23726.103/bin

# SSH
for key in (/bin/ls $HOME/.ssh | grep -E -v "\.pub\$|^known_hosts")
    ssh-add $HOME/.ssh/$key 2>/dev/null
end

# Setup programs
zoxide init fish | source

flutter config --android-sdk $HOME/Applications/android_sdk/ >/dev/null &

wezterm shell-completion --shell fish | source

set -gx GLFW_IM_MODULE ibus

. $HOME/.nix-profile/etc/profile.d/nix.fish

set -gx HF_ENDPOINT https://hf-mirror.com

set -gx LATEXINDENT_CONFIG "$HOME/.config/latexindent/indentconfig.yaml"

set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"

set -gx FZF_DEFAULT_COMMAND 'fd -H --type f --strip-cwd-prefix'

eval $(luarocks path --no-bin --lua-version 5.1)

test -r "$HOME/.opam/opam-init/init.fish"; and source "$HOME/.opam/opam-init/init.fish" >/dev/null 2>/dev/null
