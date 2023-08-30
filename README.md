Mac 常用软件安装及配置，适用于干净的系统

## Command Line Tools

因为某些命令执行完成后会要求额外执行其他命令或要求手动输入密码，所以下面的命令不建议当作 Shell 脚本一键执行，建议手动依次执行

```bash
# Enable Terminal Proxy
export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087

git config --global http.version HTTP/1.1
git config --global http.postBuffer 524288000
git config --global user.name "Xinling Jing"
git config --global user.email "jingxinling1024@163.com"
git config --global core.editor "nvim"
# 解决 Git 中文乱码问题
git config --global core.quotepath false

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jing/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# node.js
brew install node

# Software Install
# iTerm2
brew install iterm2
# Command Line Tools
# Tmux
brew install tmux
# Oh My Tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# Then you need execute command: 'p10k configure' to configure your terminal prompt style
# Hammerspoon config
curl -fsSL https://raw.githubusercontent.com/KURANADO2/hammerspoon-kuranado/main/install.sh | sh
# neovim
brew install neovim
# packer vim plugin manage
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# neovim config
git clone git@github.com:KURANADO2/neovim-config.git --depth=1 ~/.config/nvim
# nvim-telescope dependencies
brew install ripgrep
npm install -g fd-find
# nvim formatting releated
brew install stylua
pnpm i -D prettier eslint
rustup component add rustfmt
# nvim-markdown-preview dependencies
brew install pandoc
npm install -g live-server
# nvim Input method switch
brew tap daipeihust/tap && brew install im-select
# nvim python recognition
python3 -m pip install --user --upgrade pynvim
# nvim rust analyzer
brew install rust-analyzer
# wget
brew install wget
# autojump
brew install autojump
# zsh-autosuggestion
brew install zsh-autosuggestions
echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
# zsh-syntax-highlighting
brew install zsh-syntax-highlighting
echo 'source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
# fzf
brew install fzf
/opt/homebrew/opt/fzf/install
# lazygit
brew install jesseduffield/lazygit/lazygit
# svn
brew install svn
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
# exa
brew install exa
# mysql-client
brew install mysql-client
# aicommits
npm install -g aicommits
# Set the OPENAI_KEY so aicommits can use it:
# aicommits config set OPENAI_KEY=<your token>
# In the Git repository you want to install the hook in:
# aicommits hook install

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
alias gs='git status -s'
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
# 用于切换上下文配置的默认命名空间
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace'
alias k='kubectl'
alias kn='kubectl get nodes -o wide'
alias kns='kubectl get namespaces -o wide'
alias kd='kubectl get deployments -o wide'
alias kp='kubectl get pods -o wide'
alias ks='kubectl get services -o wide'
alias kst='kubectl get statefulset -o wide'
alias kc='kubectl get configmaps -o wide'
alias kpv='kubectl get pv -o wide'
alias kpvc='kubectl get pvc -o wide'
alias kl='kubectl logs'
alias klf='kubectl logs -f --tail=10 --selector'
alias kdc='kubectl describe configmap'
alias kdp='kubectl describe pod'
alias kdst='kubectl describe statefulset'
alias kdpv='kubectl describe pv'
alias kdpvc='kubectl describe pvc'
alias ke='kubectl exec -it'

# Docker
alias d='docker'
alias dp='docker ps'
alias dpa='docker ps -a'

# Shadowsocks
# Enable Terminal Proxy
# alias pon='export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;'
# Disable Terminal Proxy
# alias poff='unset http_proxy; unset https_proxy;'

# ClashX
# Enable Terminal Proxy
alias pon='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
# Disable Terminal Proxy
alias poff='unset https_proxy; unset http_proxy; unset all_proxy;'

# gsed
alias sed='gsed'

# Environment Variables
# Maven
export M2_HOME='/Users/jing/Opt/apache-maven-3.9.0'

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

# mysql-client
export MYSQL_CLIENT_HOME='/opt/homebrew/opt/mysql-client'

# PATH
export PATH=$PATH:$M2_HOME/bin:$JAVA_HOME/bin:$GO_HOME/bin:$RUST_HOME/bin:$MYSQL_CLIENT_HOME/bin

EOF
```

## System Config

```bash
# Show "Anywhere" option under "Allow apps downloaded from:"
sudo spctl --master-disable

# Show absolute path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# Docker delay speed
defaults write com.apple.Dock autohide-delay -int 0 && killall Dock
# Docker anime duration
defaults write com.apple.dock autohide-time-modifier -float 0.3;killall Dock

# Decrease Keyboard Interval
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# System-wide key repeat(need restart your mac os), related content abount this you can see here: https://gist.github.com/lsd/1e1826907ab7e49c536a
# defaults write -g ApplePressAndHoldEnabled -bool false

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
# These are assumptions, use Spotlight com.jetbrains. to get type hinting for your specific app, then restart your JetBrains' app.
```

## Manual Installed Software

- ShadowsocksX-NG
- WeChat
- Jetbrains Toolbox
    - IDEA
    - PyCharm
    - DataGrip
    - WebStorm
- Chrome
- FeiShu
- Obsidian
- Hammerspoon
- Alfred 5
    - Youdao Translate
- Mos
- Wechat Read
- BaiduNetdisk
- IINA
- Wireshark
- WPS Office
- Postman
- OpenVPN
- ossbrowser
- cosbrowser
- Maven
- SougouInput
- VNC Viewer
- MacZip

## File Backup

- ~/Tmp
- ~/Downloads
- ~/Sync
- ~/Documents
- SQL
- Nacos yaml
