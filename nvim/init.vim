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

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Remove end of line spaces
autocmd BufWritePre * :%s/\s\+$//ge
" Tab to space
autocmd BufWritePre * :%s/\t/  /ge

" ALE
highlight ALEError ctermbg=DarkMagenta
highlight ALEErrorSign ctermbg=DarkMagenta
highlight ALEErrorLine ctermbg=DarkMagenta
highlight ALEWarning ctermfg=yellow
highlight ALEWarningSign ctermfg=yellow
" highlight ALEWarningLine cterm=underline ctermfg=yellow
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:lightline_delphinus_colorscheme='nord_improved'
" nr2char(...) is for describing icons from devicons
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']
let g:ale_fixers = {
      \ 'javascript': ['prettier_standard'],
      \ 'ruby': ['rubocop']}

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd BufNewFile,BufRead *.coffee.erb setlocal ft=coffee
autocmd BufNewFile,BufRead *.coffee setlocal ft=coffee
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scss set filetype=css
let g:polyglot_disabled = ['markdown']

" deoplete
let g:deoplete#enable_at_startup = 1

" denite
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <silent> :uu :<C-u>Denite file_mru -mode=normal buffer<CR>
nnoremap <silent> :ub :<C-u>Denite buffer<CR>

" NerdTree
noremap <silent> <C-e> :NERDTree<CR>

" DevDocs
nmap K <Plug>(devdocs-under-cursor)

" indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'denite']
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=black

" ref.vim
let g:ref_open = 'vsplit'
let g:ref_refe_cmd = $HOME.'/.anyenv/envs/rbenv/shims/refe'
let g:ref_refe_version = 2

let g:ref_source_webdict_sites = {
\   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
\   'weblio': 'http://ejje.weblio.jp/content/%s',
\ }

nmap ,rr :<C-U>Ref refe<Space>

" vue
" let g:vue_disable_pre_processors = 1
