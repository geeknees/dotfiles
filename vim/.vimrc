"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/masumi/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/masumi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vtreeexplorer'
NeoBundle 'yanktmp.vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rhysd/devdocs.vim'
NeoBundle 'thinca/vim-quickrun'
"Powerline
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'thoughtbot/vim-rspec'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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
autocmd FileType ctp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.slim set filetype=slim

set ignorecase
set smartcase
"incremental search
set incsearch
set viminfo='20,\"1000

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

"VSTreeExplore
let g:treeExplVertical=1
let g:treeExplSplitRight=1
let g:treeExplWinSize=40
map <silent> vt :VSTreeExplore<CR>

"NerdTree
map <silent> nt :NERDTree<CR>

"yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"devdocs
nmap K <Plug>(devdocs-under-cursor)
