export ZSH=/home/mtarld/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"

plugins=(
	git
	git-custom
	docker-compose
	docker-compose-custom
	sudo
	wd
	catimg
	composer
	common-aliases
	common-aliases-custom
	vc-custom
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# source ~/.bin/tmuxinator.zsh
unsetopt share_history

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
