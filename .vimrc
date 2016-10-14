" """"""""""""""""""
" dein
" """""""""""""""""
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:indent_guides_enable_on_vim_startup = 1
if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-endwise')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" """"""""""""""""""
" unite.vim
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" """"""""""""""""""
" Ruby設定
" """"""""""""""""""

""""""""""""""""""""""""""""""
" 基本コーディング
""""""""""""""""""""""""""""""
" 自動カッコ補完
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""


"""""""""""""""""""
" 基本設定
" """""""""""""""""""
set backspace=indent,eol,start
set number
set paste
set clipboard=unnamed,autoselect " OSとクリップボードを共有
set autoread " ファイルが別で変更されたとき自動ロード
set noautoindent
set colorcolumn=150
set confirm
set cursorline
set encoding=utf8
set hidden
set history=2000
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set listchars=eol:¬
set mouse=a
set ruler
set scrolloff=4
set showmatch
set showtabline=2
set tabstop=2
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=list:longest,full
set title
set statusline+=%{fugitive#statusline()}
set showcmd


" """"""""""""""""
" キーマップ
" """""""""""""""
" 表示行で移動する
noremap j gj
noremap k gk

" 行頭・行末に移動する
noremap <Leader>h ^
noremap <Leader>l $

" 保存・終了する
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" タブを移動する
nnoremap <Leader>t gt
nnoremap <Leader>T gT

" ウィンドウ間を移動する
nnoremap <Leader><Tab> <C-w>w

" 検索によるハイライト表示を解除する
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" インサートモードから抜ける
inoremap jj <ESC>
let mapleader = "\<Space>"




" """""""""""""""""""
" カラー設定
" """""""""""""""""""
syntax on
colorscheme molokai
