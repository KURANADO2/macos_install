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

mkdir -p ~/Code/GitHub/
cd ~/Code/GitHub
# dotfiles
git clone https://github.com/KURANADO2/dotfiles

# zsh
ln -sf ~/Code/GitHub/dotfiles/zsh/.zshrc ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jing/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# node.js
brew install node

# Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/Code/GitHub/dotfiles/kitty ~/.config/kitty

# Tmux
brew install tmux
# Oh My Tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/Code/GitHub/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

# Powerlevel10K
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# Then you need execute command: 'p10k configure' to configure your terminal prompt style
# Starship
curl -sS https://starship.rs/install.sh | sh
# Then put this line to your ~/.zshrc
eval "$(starship init zsh)"

# Hammerspoon config
curl -fsSL https://raw.githubusercontent.com/KURANADO2/hammerspoon-kuranado/main/install.sh | sh
ln -sf ~/Code/GitHub/dotfiles/hammerspoon ~/.hammerspoon

# Vim
ln -sf ~/Code/GitHub/dotfiles/Vim/.vimrc .vimrc

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

# Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# tokei Count your code, quickly.
cargo install tokei

# oha HTTP Load Generator
cargo install oha

# wget
brew install wget
# autojump
brew install autojump
# zsh-autosuggestion(If you have been Amazon Q installed, do not use zhs-autosuggestions)
brew install zsh-autosuggestions
echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
# Amazon Q, See here: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line-getting-started-installing.html
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
# brew install exa
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

# Programming Language
# Lua
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make macosx test
make install
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

- ClashX Pro
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
- Postman
- ossbrowser
- cosbrowser
- Maven
- SougouInput
- VNC Viewer
- MacZip
- Microsoft Remote Desktop
- Another Redis Desktop Manager
- Microsoft Office
- MuseScore
- 剪映
- Language
  - Java
  - Rust
  - Go
