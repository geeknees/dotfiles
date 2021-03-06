export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \

### End of Zinit's installer chunk

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

zinit ice blockf; zinit load zsh-users/zsh-completions
zinit ice wait'!0'; zinit light rupa/z

# === PROMPT ===
eval "$(starship init zsh)"
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
alias g='cd ~/ghq/$(ghq list | peco)'
alias gits="git status"
alias gitb="git branch"
alias gitc="git checkout"
alias gitsw="git switch"
alias gitpf="git push --force-with-lease"
alias gitepr="git commit -m 'make pull request' --allow-empty"
alias t='todo.sh -t -d ~/Dropbox/PlainText/.todo.cfg'

alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'
alias vmemo='vim ~/Dropbox/work/memo/$(date +%Y%m%d).md'
alias be='bundle exec'
alias bes='bundle exec sidekiq -C config/sidekiq.yml'
alias ber='bundle exec rspec'
alias puma-dev-restart='pkill -USR1 puma-dev'
alias jul='jupyter lab'

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# gitignore ex: gi ruby >> .gitignore
# function gi() { curl https://www.gitignore.io/api/$@ ;}

# go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

# # brew
# export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/sbin:$PATH"
alias brew="env PATH=${PATH/\/Users\/${USER}\/.anyenv\/envs\/*env\/shims:/} brew"

# env
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"
