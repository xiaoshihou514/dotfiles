function proxy() {
    local port="127.0.0.1:9910"
    if [[ $http_proxy == $port ]] && [[ $https_proxy == $port ]]; then
        export http_proxy='' https_proxy=''
        echo 'Proxy closed'
        return 0
    fi
    export http_proxy=$port https_proxy=$port
    echo 'Proxy is now ready'
}

function full-upgrade() {
    sudo dnf upgrade -y
    sudo dnf autoremove -y
    sudo dnf clean all
    flatpak update -y
    flatpak remove --unused -y
    update-neovim
    fastfetch
}

function cd() {
    if [ -n "$1" ]; then
        chdir "$@"
        if [ $? -eq 0 ] && [ $(\ls $pwd | wc -l) -lt 140 ]; then
            eza --group-directories-first --icons
        fi
    else
        chdir ~
        if [ $? -eq 0 ] && [ $(\ls $pwd | wc -l) -lt 140 ]; then
            eza --group-directories-first --icons
        fi
    fi
}

function z() {
    __zoxide_z "$@"
    if [ $(\ls $pwd | wc -l) -lt 140 ]; then
        eza --group-directories-first --icons
    fi
}

function git-config-watt-toolkit() {
    current=$(grep -i 'sslCAInfo' $HOME/.gitconfig)
    if [[ $current != '' ]]; then
        sed -i '/sslCAInfo/d' $HOME/.gitconfig
        sed -i '/[http]/d' $HOME/.gitconfig
        echo "Removed watt tool certificate in .gitconfig"
    else
        git config --global http.sslCAInfo /home/xiaoshihou/.local/share/Steam++/SteamTools.Certificate.cer
        echo "Added watt tool certificate to .gitconfig"
    fi
}

function gitsquash() { git reset --soft HEAD~$1 }

function gitcpr() { git clone https://ghproxy.com/$1 }

function wgetpr() { wget https://ghproxy.com/$1 }

function aac-to-flac() {
    if [ $# -eq 1 ]; then
        out="${1%.aac}.flac"
        ffmpeg -i "$1" -c:a flac "$out"
    elif [ $# -eq 0 ]; then
        for f in *.aac; do
            out="${f%.aac}.flac"
            ffmpeg -i "$f" -c:a flac "$out"
            [ $? -ne 0 ] && echo "mission for $out failed" && return
        done
        rm *.aac
    fi
}

function psa() { ps -aux | grep $1 | grep -v "grep" }

function wcls() {
    for file in $(\ls $1); do
        wc -l "$file"
    done
}

function audio-truncate() {
    ffmpeg -i $1 -ss $2 -c copy "truncated_"$1
    [ $? -eq 0 ] && rm $1 && mv "truncated_"$1 $1
}

function update-neovim() {
    url="https://github.com/neovim/neovim/releases/download/nightly/"
    tarball="nvim-linux64.tar.gz"
    chksum="nvim-linux64.tar.gz.sha256sum"
    builtin chdir $HOME/Applications/ 
    wget -qq $url$tarball
    wget -qq $url$chksum
    sha256sum -c $chksum | grep OK > /dev/null
    if [ $? != 0 ]; then
        echo "\x1b[31mNeovim binary corrupted! \x1b[0m"
        rm $tarball
        rm $chksum
        return 1
    fi
    echo "\nsha256 verified"
    rm -rf nvim-linux64 2> /dev/null
    tar -xf $tarball
    rm $tarball
    rm $chksum
    echo "Neovim updated successfully\n"
    ./nvim-linux64/bin/nvim --version
    builtin chdir -
}
