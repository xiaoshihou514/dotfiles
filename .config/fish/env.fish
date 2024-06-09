# Path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/Applications/nvim-nightly/bin
fish_add_path $HOME/Applications/lua_ls/bin
fish_add_path $HOME/Applications/stylua-linux
fish_add_path $HOME/.luarocks/bin
fish_add_path $HOME/Applications/kotlin_ls/bin
fish_add_path $HOME/Applications/kotlin_dap/bin
fish_add_path $HOME/Applications/detekt-cli-1.23.3/bin
fish_add_path $HOME/Applications/flutter/bin
fish_add_path $HOME/Applications/android_sdk/cmdline-tools/latest/bin
fish_add_path $HOME/.gem/bin
fish_add_path $HOME/.local/share/coursier/bin
fish_add_path $HOME/.local/share/juliaup/bin
fish_add_path $HOME/Applications/c-tools/bin

# Setup programs
zoxide init fish | source

flutter config --android-sdk $HOME/Applications/android_sdk/ >/dev/null &

wezterm shell-completion --shell fish | source

set -g GLFW_IM_MODULE ibus

. $HOME/.nix-profile/etc/profile.d/nix.fish

flamegraph --completions fish | source

set -g HF_ENDPOINT https://hf-mirror.com

set -Ua fish_user_paths "$HOME/.rye/shims"

set -g LATEXINDENT_CONFIG "$HOME/.config/latexindent/indentconfig.yaml"
