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

" 2016.04.16 追記
" load_cache -> load_state
" save_cache -> save_state
" となり書き方が少し変わりました。
" 追記終わり

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

syntax on
set number
set title
set ruler
set noswapfile
set list
set listchars=tab:^.
set backspace=indent,eol,start
set showmatch
set hlsearch
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set noautoindent
set ignorecase
set smartcase
set incsearch
set viminfo='20,\"1000
set clipboard=unnamed

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/
nmap <Esc><Esc> :nohlsearch<CR><Esc>

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.slim set filetype=slim

"Remove end of line spaces
autocmd BufWritePre * :%s/\s\+$//ge
"Tab to space
autocmd BufWritePre * :%s/\t/  /ge

"set cursorl highlight
set cursorline
"set window highlight
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
hi CursorLine ctermbg=darkblue guibg=black

"show status bar
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L
hi StatusLine gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue
hi StatusLineNC gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=White

"start with insert mode
let g:unite_enable_start_insert=1

"mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

"to shutdown wiht ESC ESC
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"NerdTree
map <silent> <C-e> :NERDTree<CR>

"yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"devdocs
nmap K <Plug>(devdocs-under-cursor)
