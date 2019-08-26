export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

local GRAY=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local PURPLE=$'%{\e[1;35m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$WHITE

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
POWERLEVEL9K_MODE='nerdfont-complete'
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug "rupa/z", use:z.sh

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load --verbose

# === PROMPT ===

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs date time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="👺 "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DATE_FORMAT="%D{%Y/%m/%d %a}"

# /=== PROMPT ===

HISTFILE=$HOME/.zsh_history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history
setopt append_history
function history-all { history -E 1 } # 全履歴の一覧を出力する

setopt auto_list
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks

export XDG_CONFIG_HOME=$HOME/.config

alias ls='ls -vG'
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias vi="nvim"
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gits="git status"
alias gitb="git branch"
alias gitc="git checkout"
alias gitepr="git commit -m 'make pull request' --allow-empty"
alias t='todo.sh -t -d ~/Dropbox/PlainText/.todo.cfg'

alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'
alias vmemo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias be='bundle exec'
alias bes='bundle exec sidekiq -C config/sidekiq.yml'
alias ber='bundle exec rspec'
alias jun='jupyter notebook'
alias jul='jupyter lab'

# gitignore ex: gi ruby >> .gitignore
# function gi() { curl https://www.gitignore.io/api/$@ ;}

# go
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# # brew
# export PATH="/usr/local/sbin:$PATH"
# export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/sbin:$PATH"
alias brew="env PATH=${PATH/\/Users\/${USER}\/.anyenv\/envs\/*env\/shims:/} brew"

# # For node
# export NODE_PATH=/usr/local/lib/node:$PATH
# export PATH=/usr/local/share/npm/bin:$PATH

# # For Yarn
# export PATH=$(yarn global bin):$PATH

# env
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
