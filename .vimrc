" vi互換を無効化
set nocompatible

filetype off

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/neocomplcache-clang_complete.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'fuenor/qfixgrep.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'plasticboy/vim-markdown.git'
NeoBundle 'mattn/mkdpreview-vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'thinca/vim-fontzoom.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'violetyk/cake.vim.git'
NeoBundle 'taka84u9/unite-git.git'
NeoBundle 'motemen/git-vim.git'
NeoBundle 'sgur/unite-git_grep.git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'csexton/rvm.vim'
NeoBundle 'ujihisa/rdoc.vim'

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

" 自動改行を回避
set formatoptions=q

" タブ設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" 自動改行しないように
set tw=0

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

" -------------------------------------------------
" Unite.vim
" -------------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1

" buffers
nnoremap <silent> <C-b> :<C-u>Unite buffer<CR>

" file list
nnoremap <silent> <C-f> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')<C-w>L
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" -------------------------------------------------
" VimFiler.vim
" -------------------------------------------------
" 画面分割して開く
noremap <C-F><C-F> :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" Fugitive.vim
nnoremap <silent> <C-@> :call<Space>ToggleGstatus()<CR>
function! ToggleGstatus()
  if bufexists(".git/index")
    execute "bw .git/index"
  else
    execute "Gstatus"
  endif
endfunction

" qfixApp
set runtimepath+=~/.vim/plugins/qfixapp
let QFixHowm_Key = 'g'
let howm_dir             = '~/.vim/howm_dir'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.mkd'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'

