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
fish_add_path $HOME/Applications/idea-IU-242.23726.103/bin
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/.elan/bin
fish_add_path $HOME/.opencode/bin

# SSH
set ssh_settings (ssh-agent -s)
set -gx SSH_AUTH_SOCK (echo $ssh_settings | grep 'SSH_AUTH_SOCK=' | cut -d= -f2 | cut -d';' -f1)
set -gx SSH_AGENT_PID (echo $ssh_settings | grep 'SSH_AGENT_PID=' | cut -d= -f2 | cut -d';' -f1)
for key in (/bin/ls $HOME/.ssh | grep -E -v "\.pub\$|^known_hosts")
    ssh-add $HOME/.ssh/$key 2>/dev/null
end

# Setup programs
if type -q zoxide then
    zoxide init fish | source
end

if type -q flutter then
    set -gx FL_ANDROID_SDK $HOME/Applications/android-studio-sdk
    # flutter config --android-sdk $FL_ANDROID_SDK >/dev/null &
    set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
    set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
end

if type -q wezterm then
    wezterm shell-completion --shell fish | source
end

set -gx GLFW_IM_MODULE ibus

if type -q -f $HOME/.nix-profile/etc/profile.d/nix.fish then
    . $HOME/.nix-profile/etc/profile.d/nix.fish
end

set -gx HF_ENDPOINT https://hf-mirror.com

set -gx LATEXINDENT_CONFIG "$HOME/.config/latexindent/indentconfig.yaml"

set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"

set -gx FZF_DEFAULT_COMMAND 'fd -H --type f --strip-cwd-prefix'

if type -q luarocks then
    eval $(luarocks path --no-bin --lua-version 5.1)
end

test -r "$HOME/.opam/opam-init/init.fish"; and source "$HOME/.opam/opam-init/init.fish" >/dev/null 2>/dev/null

set -gx MANPAGER 'nvim +Man!'

set -gx XWECHAT "$HOME/.var/app/com.tencent.WeChat/xwechat_files/"

set -gx UV_DEFAULT_INDEX "https://mirrors.aliyun.com/pypi/simple"

tirith init --shell fish | source
