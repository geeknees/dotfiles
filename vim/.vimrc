set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'vundle'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
"php manual
let g:ref_phpmanual_path = $HOME . '/Documents/Reference/phprefm'
"Bundle 'thinca/vim-quickrun'

"Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

"PHP
"Bundle 'violetyk/cake.vim'

"Html
Bundle 'mattn/zencoding-vim'

"Bundle 'The-NERD-tree'
"Bundle 'project.vim'
Bundle 'taglist.vim'
Bundle 'vtreeexplorer'
let g:treeExplVertical=1
let g:treeExplSplitRight=1
let g:treeExplWinSize=40

Bundle 'yanktmp.vim'

"TweetVim and Dependencies
Bundle 'basyura/TweetVim'
Bundle 'mattn/webapi-vim'
Bundle 'basyura/twibill.vim'
Bundle 'tyru/open-browser.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'basyura/bitly.vim'

Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required!

colorscheme desert
syntax on
set number
set title
set ruler
set noswapfile

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

set list
set listchars=tab:^.

set backspace=indent,eol,start
set showmatch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set noautoindent


autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.ctp set filetype=php

set ignorecase
set smartcase
"incremental search
set incsearch

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
highlight CursorLine ctermbg=darkblue  guibg=darkred

"show status bar
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L
hi StatusLine gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue
hi StatusLineNC gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=White

"neocomplcache
"active at startup
let g:neocomplcache_enable_at_startup = 1

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

"Tlist
map <silent> tl :Tlist<CR>

"VSTreeExplore
map <silent> vt :VSTreeExplore<CR>

"yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
