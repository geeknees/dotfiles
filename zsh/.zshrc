export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

# === PROMPT ===
local gray=$'%{\e[0;30m%}'
local red=$'%{\e[0;31m%}'          # 赤色
local green=$'%{\e[0;32m%}'        # 緑色
local yellow=$'%{\e[0;33m%}'       # 黄色
local blue=$'%{\e[0;34m%}'         # 青色
local purple=$'%{\e[0;35m%}'       # 紫色
local light_blue=$'%{\e[0;36m%}'   # 水色
local white=$'%{\e[0;37m%}'        # 白色
local GRAY=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'          # 赤色
local GREEN=$'%{\e[1;32m%}'        # 緑色
local YELLOW=$'%{\e[1;33m%}'       # 黄色
local BLUE=$'%{\e[1;34m%}'         # 青色
local PURPLE=$'%{\e[1;35m%}'       # 紫色
local LIGHT_BLUE=$'%{\e[1;36m%}'   # 水色
local WHITE=$'%{\e[1;37m%}'        # 白色
local DEFAULT=$white               # 標準の色

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "rupa/z", use:"*.sh"
zplug "supercrabtree/k"

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load --verbose

PURE_PROMPT_SYMBOL="👺"
RPROMPT="$GRAY %w %*"

# /=== PROMPT ===

HISTFILE=$HOME/.zsh_history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
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
alias h='habitica'
alias ht='habitica todos'
alias hs='habitica status'

alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'
alias vmemo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias amemo='atom ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias global-ip='curl ifconfig.io'
alias be='bundle exec'
alias bes='bundle exec sidekiq -C config/sidekiq.yml'
alias ber='bundle exec rspec'
alias puma-dev-restart='pkill -USR1 puma-dev'
alias jun='jupyter notebook'
alias jul='jupyter lab'

# gitignore ex: gi ruby >> .gitignore
function gi() { curl https://www.gitignore.io/api/$@ ;}

# brew
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"

# For crontab
export EDITOR=/usr/local/bin/nvim

# For node
export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# For yarn
export PATH=$(yarn global bin):$PATH

export PATH="$HOME/.pyenv/shims:$PATH"

# caffe
# export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH
# export CAFFE_ROOT=$HOME/caffe

# go
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# cuda
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
