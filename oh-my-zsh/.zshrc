export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

ZSH_THEME="agnoster-custom"
DISABLE_AUTO_TITLE="true"
ZSH_CUSTOM="$HOME/.dotfiles/oh-my-zsh"

plugins=(
  common-aliases
  fzf
  git
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions

  aliases
)

source $ZSH/oh-my-zsh.sh

# Do not share history between windows and panes
unsetopt share_history
