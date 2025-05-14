#!/bin/bash

# Enable Terminal Proxy
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

# Git config
git config --global http.version HTTP/1.1
git config --global http.postBuffer 524288000
git config --global user.name "Xinling Jing"
git config --global user.email "jingxinling1024@163.com"
git config --global core.editor "nvim"
# Solve the problem of garbled Chinese characters in Git
git config --global core.quotepath false

# dotfiles
mkdir -p ~/Code/GitHub/
cd ~/Code/GitHub
git clone https://github.com/KURANADO2/dotfiles

# zsh
ln -sf ~/Code/GitHub/dotfiles/zsh/.zshrc ~/.zshrc
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
    echo
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/jing/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# node.js
brew install node
# Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
# Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/Code/GitHub/dotfiles/kitty ~/.config/kitty
# Starship
curl -sS https://starship.rs/install.sh | sh
# Then put this line to your ~/.zshrc
eval "$(starship init zsh)"
ln -sf ~/Code/GitHub/dotfiles/starship/starship.toml ~/.config/starship.toml
# Hammerspoon config
# curl -fsSL https://raw.githubusercontent.com/KURANADO2/hammerspoon-kuranado/main/install.sh | sh
ln -sf ~/Code/GitHub/dotfiles/hammerspoon ~/.hammerspoon
# Vim
ln -sf ~/Code/GitHub/dotfiles/vim/.vimrc ~/.vimrc
# Neovim
brew install neovim
# nvim-telescope dependencies
brew install ripgrep
npm install -g fd-find
# nvim Input method switch
brew tap daipeihust/tap && brew install im-select
# live-server
npm install -g live-server
# LazyVim
ln -sf ~/Code/GitHub/dotfiles/nvim nvim
# IdeaVim
ln -sf ~/Code/GitHub/dotfiles/IdeaVim/.ideavimrc .ideavimrc
# tokei Count your code, quickly.
cargo install tokei
# oha HTTP Load Generator
cargo install oha
# wget
brew install wget
# zsh-autosuggestion(If you have been Amazon Q installed, do not use zhs-autosuggestions)
# brew install zsh-autosuggestions
# echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
# Amazon Q, https://github.com/aws/amazon-q-developer-cli
brew install amazon-q
# zsh-syntax-highlighting
brew install zsh-syntax-highlighting
echo 'source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>~/.zshrc
# fzf
brew install fzf
/opt/homebrew/opt/fzf/install
# lazygit
brew install jesseduffield/lazygit/lazygit
# svn
brew install svn
# neofetch
brew install neofetch
# jq for Json format
brew install jq
# tree
brew install tree
# tldr
brew install tldr
# sshpass
brew install hudochenkov/sshpass/sshpass
# telnet
brew install telnet
# you-get
brew install you-get
# gnu-sed
brew install gnu-sed
# lrzsz
brew install lrzsz
# bat
brew install bat
# eza
cargo install eza
# mysql-client(It contains mysql and mysqldump bin binary)
brew install mysql-client
# keycastr
brew install --cask keycastr
# aicommits
npm install -g aicommits
# pandoc
brew install pandoc
# Luarocks
brew install luarocks
# yazi
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
# cmake
brew install cmake
# sshfs
brew install --cask macfuse
brew install gromgit/fuse/sshfs-mac
# btop
brew install btop
# musicfox
brew install anhoder/go-musicfox/go-musicfox
# for k8s log
brew install stern
# LazySSH
cargo install lazyssh
# Lazydocker
brew install jesseduffield/lazydocker/lazydocker
# Lua
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make macosx test
make install

# System Config
# Show "Anywhere" option under "Allow apps downloaded from:"
sudo spctl --master-disable
# Show absolute path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Docker delay speed
defaults write com.apple.Dock autohide-delay -int 0 && killall Dock
# Docker anime duration
defaults write com.apple.dock autohide-time-modifier -float 0.3
killall Dock
# Decrease Keyboard Interval
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
# If you only want this behavior for specific JetBrains' apps, use:
# Community Edition IntelliJ
defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
# Ultimate Edition IntelliJ
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
# DataGrip
defaults write com.jetbrains.datagrip ApplePressAndHoldEnabled -bool false
# WebStorm:
defaults write com.jetbrains.WebStorm ApplePressAndHoldEnabled -bool false
# PyCharm:
defaults write com.jetbrains.pycharm ApplePressAndHoldEnabled -bool false
# Android Studio:
defaults write com.google.android.studio ApplePressAndHoldEnabled -bool false
# AppCode:
defaults write com.jetbrains.appcode ApplePressAndHoldEnabled -bool false
# RubyMine:
defaults write com.jetbrains.rubymine ApplePressAndHoldEnabled -bool false
