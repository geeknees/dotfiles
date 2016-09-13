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
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rhysd/devdocs.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on
set number
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
set laststatus=2
set background=dark

hi clear CursorLine
hi CursorLine ctermbg=darkblue guibg=black

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Remove end of line spaces
autocmd BufWritePre * :%s/\s\+$//ge
" Tab to space
autocmd BufWritePre * :%s/\t/  /ge

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.slim set filetype=slim

" previm
let g:vim_markdown_folding_disabled=1

" deoplete
let g:deoplete#enable_at_startup = 1

" mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

" file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

" file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

" to shutdown wiht ESC ESC
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" NerdTree
noremap <silent> <C-e> :NERDTree<CR>

" quirck run
let g:quickrun_no_default_key_mappings = 1
nmap <unique> <C-r> <Plug>(quickrun)

" devdocs
nmap K <Plug>(devdocs-under-cursor)
