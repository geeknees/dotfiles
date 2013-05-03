export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_ALL=C
export LESSCHARSET=utf-8

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

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

RPROMPT="%1(v|%F{red}%1v%f|)"
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

alias memo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias tmux='tmux -u'

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/share/python:/Applications/android-sdk-macosx/tools
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# For crontab
export EDITOR=/usr/bin/vim

# For node
export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# For tig
export LC_ALL="en_US.UTF-8"

# For unix shortcut on tmux
bindkey -e

# For z
 . `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

