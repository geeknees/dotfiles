" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . 'dein.toml'
  let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" vimprocだけは最初にインストールしてほしい
" if dein#check_install(['vimproc'])
"   call dein#install(['vimproc'])
" endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

filetype plugin indent on
syntax enable

set number
set noswapfile
set list
set listchars=tab:^.
set backspace=indent,eol,start
set hlsearch
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set ignorecase
set smartcase
set incsearch
set viminfo='20,\"1000
set clipboard=unnamed
set background=dark
set cursorline
colorscheme Tomorrow-Night-Bright

hi clear CursorLine
hi CursorLine ctermbg=234 guibg=black

set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline,bold

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" Remove end of line spaces
autocmd BufWritePre * :%s/\s\+$//ge
" Tab to space
autocmd BufWritePre * :%s/\t/  /ge

" 【Ctrl + d + b】 バッファを表示
nnoremap <silent><C-d>b :<C-u>Denite buffer -split=floating file:new<CR>
" 【Ctrl + d + f】 カレントディレクトリを表示
nnoremap <silent><C-d>f :<C-u>Denite file -split=floating file:new<CR>
" 【Ctrl + d + r】 カレントディレクトリ以下を再帰的に表示
nnoremap <silent><C-d>r :<C-u>Denite file/rec -split=floating file:new<CR>
