# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dzania/.oh-my-zsh"
export TERM="screen-256color"



ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

plugins=(
  git 
  sudo
)

source $ZSH/oh-my-zsh.sh



# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
# TMUX bindings 
alias t="tmux attach -t"
alias tnew="tmux new -s"
alias tk="tmux detach" 
alias tds="tmux detach -s"
alias tks="tmux kill-session -t"
alias tls="tmux ls"
alias treorder="tmux movew -r"
# -----------------
alias cat="bat --paging=never"

export FZF_DEFAULT_COMMAND="fdfind . $HOME"

export PATH=$PATH:/usr/local/go/bin

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent /bye
export GPG_TTY=$(tty)

alias copy='xclip -sel clip'
bindkey -v 
# Tmux sessionizer
bindkey -s '^F' "tmux-sessionizer\n"

[[ -s /home/dzania/.autojump/etc/profile.d/autojump.sh ]] && source /home/dzania/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(fzf --zsh)
# // WORK
#[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/dzania/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#eval "$(direnv hook zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

alias cf='cargo fmt'
alias psf='poetry shell'
alias j='z'
source /home/dzania/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
