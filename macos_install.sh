#!/bin/bash

# Change the default shell to zsh
chsh -s /bin/zsh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Software Install
# iTerm2
brew install iterm2
# Command Line Tools
# Tmux
brew install tmux
# Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# Oh My Tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# Hammerspoon
curl -fsSL https://raw.githubusercontent.com/KURANADO2/hammerspoon-kuranado/main/install.sh | sh
# neovim
brew install neovim
# packer vim plugin manage
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# neovim config
git clone git@github.com:KURANADO2/neovim-config.git --depth=1 ~/.config/nvim
# wget
brew install wget
# autojump
brew install autojump
# fzf
brew install fzf
# Git
brew install git
git config --global user.name "Xinling Jing"
git config --global user.email "jingxinling1024@163.com"
# lazygit
brew install jesseduffield/lazygit/lazygit
# svn
brew install svn
# Node.js
brew install node
# htop
brew install htop-osx
# neofetch
brew install neofetch
# jq for Json format
brew install jq
# tree
brew install tree
# tldr
brew install tldr
# sshpass
brew install sshpass
# bat
brew install bat
# telnet
brew install telnet
# you-get
brew install you-get
# gnu-sed
brew install gnu-sed

# Programming Language
# Lua
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make macosx test
make install

# Config dot file
# ~/.zshrc
cat >>~/.zshrc<<EOF

# Alias
# ls
alias ll='ls -l'
alias l='ll'
alias la='l -a'

# Tmux
alias tnew='tmux new -s'
alias ta='tmux a -t'

# Git
alias g='git'
alias ginit='git init'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gl='git log --graph'
alias gt='git tag -a'
alias gfetch='git fetch'
alias gpull='git pull origin'
alias gpush='git push origin'
alias gshow='git show'
alias gcommit='git commit'
alias gadd='git add'
alias gremote='git remote'
alias gcheckout='git checkout'
alias gclone='git clone'
alias greset='git reset'
alias gmerge='git merge'
alias gbranch='git branch'
alias gcherry='git cherry-pick'

# Lazygit
alias lg='lazygit'

# Neovim
alias vim='nvim'

# K8S
alias k='kubectl'
# 用于切换上下文配置的默认命名空间
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace'
alias kp='kubectl get pods'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kd='kubectl describe pod'

# Docker
alias d='docker'
alias dp='docker ps'
alias dpa='docker ps -a'

# Shadowsocks
# Enable Terminal Proxy
alias pon='export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;'
# Disable Terminal Proxy
alias poff='unset http_proxy; unset https_proxy;'

# gsed
alias sed='gsed'

# Environment Variables
# Maven
export M2_HOME='/Users/jing/Opt/apache-maven-3.8.3'

# Java
export JDK8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home'
export JDK11_HOME='/Library/Java/JavaVirtualMachines/jdk-11.0.16.1.jdk/Contents/Home'
export JDK18_HOME='/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk/Contents/Home'

export JAVA_HOME=$JDK8_HOME

alias jdk8='export JAVA_HOME=$JDK8_HOME'
alias jdk11='export JAVA_HOME=$JDK11_HOME'
alias jdk18='export JAVA_HOME=$JDK18_HOME'

# Go
export GO_HOME='/usr/local/go'

# Rust
export RUST_HOME='/Users/jing/.cargo'

# PATH
export PATH=$PATH:$M2_HOME/bin:$JAVA_HOME/bin:$GO_HOME/bin:$RUST_HOME/bin

EOF

# System Config
# Show "Anywhere" option under "Allow apps downloaded from:"
sudo spctl --master-disable
# Show absolute path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Docker delay speed
defaults write com.apple.Dock autohide-delay -int 0 && killall Dock
# Docker anime duration
defaults write com.apple.dock autohide-time-modifier -float 0.3;killall Dock
# Keyboard Interval
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

