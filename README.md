mtarld's dotfiles
=================

## TODO
- invert esc/caps lock
- i3 window and specific workspaces
- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

## Installation

### Clone the dotfiles repository
```
git clone git@github.com:mtarld/dotfiles.git $HOME/.dotfiles
```

### Setup basic packages
```
sudo apt install \
  vim \
  curl \
  htop \
  xclip \
  tree \
  fzf \
  ripgrep \
  fd-find \
  bat \
  fonts-powerline \
  make \
  gcc \
  clang \
  build-essential \
  mycli \
  tidy \
  jq \
  gnome-screenshot

sudo apt remove nano

sudo ln -sf /usr/bin/batcat /usr/local/bin/bat
```

### Install required fonts
Install [Jetbrains Mono](https://www.nerdfonts.com/font-downloads)
```
sudo apt install fonts-powerline  # for oh my tmux
```

### Install and configure "git"
```
sudo apt install git

ln -sf $HOME/.dotfiles/git/.gitignore $HOME/.gitignore
ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
```

### Install and configure "regolith"
```
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

# Valid only for Ubuntu 22.04
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

sudo apt update
sudo apt install regolith-desktop regolith-look-nord i3xrocks-battery i3xrocks-rofication
sudo apt upgrade

ln -sf $HOME/.dotfiles/regolith/Xresources $HOME/.config/regolith2/Xresources

mkdir -p $HOME/.config/regolith2/i3xrocks/conf.d
cp -R /usr/share/i3xrocks/conf.d/01_setup $HOME/.config/regolith2/i3xrocks/conf.d/01_setup
cp -R /usr/share/i3xrocks/conf.d/80_rofication $HOME/.config/regolith2/i3xrocks/conf.d/50_rofication
cp -R /usr/share/i3xrocks/conf.d/80_battery $HOME/.config/regolith2/i3xrocks/conf.d/60_battery
cp -R /usr/share/i3xrocks/conf.d/90_time $HOME/.config/regolith2/i3xrocks/conf.d/70_time

regolith-look refresh
```

### Install and configure "node"
```
curl -L https://bit.ly/n-install | bash
```

### Install and configure "oh my zsh"
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/oh-my-zsh/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/oh-my-zsh/plugins/zsh-autosuggestions

ln -sf $HOME/.dotfiles/oh-my-zsh/.zshrc $HOME/.zshrc
```

### Install and configure "tmux"
```
sudo apt install tmux tmuxinator

git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
ln -sf $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/tmux/.tmux.conf.local $HOME/.tmux.conf.local

sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
ln -sf $HOME/.dotfiles/tmux/projects $HOME/.tmuxinator

sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
```

### Install and configure "php"
```
sudo apt install php php-cli php-gd php-xml php-curl php-mysql php-intl php-mbstring

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

git clone git@github.com:phpactor/phpactor $HOME/.phpactor
cd $HOME/.phpactor
composer install -o --no-dev
sudo ln -sf $HOME/.phpactor/bin/phpactor /usr/local/bin/phpactor
ln -sf $HOME/.dotfiles/phpactor $HOME/.config/phpactor

composer global require friendsofphp/php-cs-fixer vimeo/psalm
```

### Install and configure "neovim"
```
# Decrypt notes.md
$HOME/.dotfiles/notes/decrypt.sh

cd /tmp
NVIM_VERSION=v0.8.0 # Put the last version available
curl -LO https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
cd -
rm -rf $HOME/.local/share/nvim

git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1

ln -sf $HOME/.dotfiles/nvim/nvchad $HOME/.config/nvim/lua/custom
ln -sf $HOME/.dotfiles/nvim/.editorconfig $HOME/.editorconfig

nvim +PackerSync
```

### Install and configure "docker"
```
sudo apt install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER

sudo ln -sf $HOME/.dotfiles/docker/docker-compose /usr/local/bin/docker-compose
```

### Misc
```
# Disable network notifications
gsettings set org.gnome.nm-applet disable-disconnected-notifications "true"
gsettings set org.gnome.nm-applet disable-connected-notifications "true"
```
