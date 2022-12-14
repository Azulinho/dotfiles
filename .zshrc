# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="history*:exit:h"
export HISTTIMEFORMAT="%y-%m-%d %T"

unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/azul/.zshrc'

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# End of lines added by compinstall
#
export PATH=~/bin:/run/wrappers/bin:~/.nodenv/bin:$PATH
eval "$(direnv hook zsh)"
export PATH="$HOME/.tfenv/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.emacs.d/bin:~/apps/ide:$PATH"

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)


setxkbmap gb
# https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

export BW_SESSION=`cat ~/.secrets/bw.session`
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
#source /usr/share/nvm/init-nvm.sh

export PATH="${PATH}:${HOME}/.krew/bin"

if [[ -z "${SSH_AGENT_PID}" ]]; then
  eval `ssh-agent` >/dev/null 2>&1
fi

ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
ssh-add ~/.ssh/aventus > /dev/null 2>&1

#source /home/azul/.config/broot/launcher/bash/br
source ~/apps/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      alias dir='dir --color=auto'
      alias vdir='vdir --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
  fi

# # https://jdhao.github.io/2019/06/13/zsh_bind_keys/
# bindkey '^[[H' beginning-of-line
# bindkey '^[[F' end-of-line

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

#source /usr/share/zsh/share/antigen.zsh

#antigen bundle zsh-users/zsh-completions


complete -C aws_completer aws

#set -o vi
#bindkey -s "^R" "^[0i__resh_widget_control_R_compat^J"
#

[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


function toolbox() {
docker run -it \
    -v $HOME/.ssh:/home/user/.ssh \
    -v $HOME/.gitconfig:/home/user/.gitconfig \
    -v $HOME/.gitignore:/home/user/.gitignore \
    -v $HOME/.gnupg:/home/user/.gnupg \
    -v $HOME/.aws:/home/user/.aws \
    -v $HOME/.vimrc:/home/user/.vimrc \
    -v $HOME/.tmux:/home/user/.tmux \
    -v $HOME/.tmux.conf:/home/user/.tmux.conf \
    -v $HOME/.toolbox/vim:/home/user/.vim \
    -v $HOME/.toolbox/gems:/home/user/.gem \
    -v $HOME/.toolbox/SpaceVim:/home/user/.SpaceVim \
    -v $HOME/.toolbox/SpaceVim.d:/home/user/.SpaceVim.d \
    -v $HOME/.toolbox/.cache/vimfiles:/home/user/.cache/vimfiles \
    -v $HOME/.ctags.d:/home/user/.ctags.d \
    -v $HOME/.toolbox/pyenv:/home/user/.pyenv/versions \
    -v $HOME/.toolbox/rubies:/home/user/.rubies \
    -v $HOME/.toolbox/tfenv:/home/user/.tfenv/versions \
    -v $HOME/.toolbox/pkenv:/home/user/.pkenv/versions \
    -v $PWD:/workdir \
    -e UID=`id -u` \
    -e GID=`id -g` \
  registry.gitlab.com/thecornershop/toolbox $*
}


export PATH=/home/azul/.local/bin:$PATH

 eval "$(nodenv init -)"

 source /usr/local/share/chruby/chruby.sh
 source /usr/local/share/chruby/auto.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=vim
