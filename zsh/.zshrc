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

setopt prompt_subst
PROMPT=" $red%{%}$red%T$YELLOW@%m:$GREEN%~$HOSTNAME
⚡ $DEFAULT"

autoload vcs_info
# gitのみ有効にする
zstyle ":vcs_info:*" enable git
# commitしていない変更をチェックする
zstyle ":vcs_info:git:*" check-for-changes true
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する
zstyle ":vcs_info:git:*" formats "%c%u[%b:%r]"
# gitリポジトリに対して、コンフリクトなどの情報を表示する
zstyle ":vcs_info:git:*" actionformats "%c%u<%a>[%b:%r]"
# addしていない変更があることを示す文字列
zstyle ":vcs_info:git:*" unstagedstr "<U>"
# commitしていないstageがあることを示す文字列
zstyle ":vcs_info:git:*" stagedstr "<S>"

# git：まだpushしていないcommitあるかチェックする
my_git_info_push () {
  if [ "$(git remote 2>/dev/null)" != "" ]; then
    local head="$(git rev-parse HEAD)"
    local remote
    for remote in $(git rev-parse --remotes) ; do
      if [ "$head" = "$remote" ]; then return 0 ; fi
    done
    # pushしていないcommitがあることを示す文字列
    echo "<P>"
  fi
}

# git：stashに退避したものがあるかチェックする
my_git_info_stash () {
  if [ "$(git stash list 2>/dev/null)" != "" ]; then
    # stashがあることを示す文字列
    echo "{s}"
  fi
}

# vcs_infoの出力に独自の出力を付加する
my_vcs_info () {
  vcs_info
  echo $(my_git_info_stash)$(my_git_info_push)$vcs_info_msg_0_
}
RPROMPT=$'$(my_vcs_info)'

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

autoload -U compinit && compinit

export XDG_CONFIG_HOME=$HOME/.config
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ls='ls -vG'
alias ll='ls -la'
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias vi="nvim"
alias g="git"
alias gits="git status"
alias gitb="git branch"
alias t='todo.sh -t -d ~/Dropbox/PlainText/.todo.cfg'

alias vmemo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias amemo='atom ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias random-text='openssl rand -base64 12 | fold -w 10 | head -1'
alias global-ip='curl ifconfig.io'

# gitignore ex: gi ruby >> .gitignore
function gi() { curl https://www.gitignore.io/api/$@ ;}

# brew
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"

# For crontab
export EDITOR=/usr/bin/vim

# For node
export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# For tig
export LC_ALL="en_US.UTF-8"

# For z
 . `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

# Roswell - Common Lisp environment setup Utility.
export PATH="$PATH:$HOME/.roswell/bin"

# pyenv
export PATH="$HOME/.pyenv/shims:$PATH"

# caffe
export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH
export CAFFE_ROOT=$HOME/caffe

# go
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
