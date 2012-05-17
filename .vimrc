" vi互換を無効化
set nocompatible

filetype off

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/plugins/neobundle.vim.git/

  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'

filetype plugin on
filetype indent on

" 行番号の設定
set number
set ruler
hi LineNr ctermfg=darkgrey ctermbg=black

" status lineの表示
set laststatus=2

" status lineへ文字コード 改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" スワップファイルの場所
set directory=~/.vim/swap

" バックアップファイルの場所
set backupdir=~/.vim/backup

" タブ設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" syntaxを有効化
syntax on


" カラースキーマを設定
set t_Co=256
colorscheme candycode

" カーソル行をハイライト
set cursorline

" タブ移動など
map <C-N> :tabn<CR>
map <C-P> :tabp<CR>
map <C-K> :tabnew<CR>

" qfixApp
set runtimepath+=~/.vim/plugins/qfixapp
let QFixHowm_Key = 'g'
let howm_dir             = '~/.vim/howm_dir'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

