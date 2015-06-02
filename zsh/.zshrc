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

# prompt
#PROMPT="$YELLOW%{%}[%~]%{%}:$GREEN%n@%m%u% $ "
setopt prompt_subst
#PROMPT="$GREEN%~ $BLACK
#$HOSTNAME $YELLOW%U%n$DEFAULT "
PROMPT="$RED%{[%}$RED%T$YELLOW@%m:$GREEN%~$BLACK$HOSTNAME]
$YELLOW≫ $DEFAULT"

#$YELLOW⚡  $DEFAULT"
#PROMPT="$YELLOW⚡ $DEFAULT"

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

#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
#precmd () {
#  psvar=()
#  LANG=en_US.UTF-8 vcs_info
#  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#
#RPROMPT="%1(v|%F{red}%1v%f|)"
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

alias ls='ls -vG'
alias ll='ls -la'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias vi="vim"
alias g="git"
alias gits="git status"
alias gitb="git branch"
alias t='todo.sh'
alias rake='bundle exec rake'
#alias svn-clean='rm -rf `find ./ -type d -name .svn ! -regex \.svn/. -print`'
#alias swp-clean='rm -rf `find ./ -type d -name .swp ! -regex \.swp/. -print`'
#alias git-clean='rm -rf `find ./ -type d -name .git ! -regex \.git/. -print`'

alias vmemo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias smemo='sublime ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias tmux='tmux -u'

# For crontab
export EDITOR=/usr/bin/vim

# For tig
export LC_ALL="en_US.UTF-8"

# For unix shortcut on tmux
bindkey -e

# For z
 . `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

export PATH=/usr/local/bin:$PATH

# PATH for madever
PATH=$HOME/.cabal/bin:$PATH
function gi() { curl http://www.gitignore.io/api/$@ ;}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.pyenv/shims:$PATH"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
#export COCOS_CONSOLE_ROOT=/Users/masumi/Downloads/cocos2d-x-3.2/tools/cocos2d-console/bin
#export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
#export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
#export PATH=$ANDROID_SDK_ROOT:$PATH
#export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# For node
export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# PATH for postgresql
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH:$PATH"

