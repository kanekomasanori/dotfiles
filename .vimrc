" vi互換を無効化
set nocompatible

" 自動読み込み
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

filetype off

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/neocomplcache-clang_complete.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neomru.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'tsukkee/unite-tag.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'thinca/vim-fontzoom.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'taka84u9/unite-git.git'
NeoBundle 'motemen/git-vim.git'
NeoBundle 'sgur/unite-git_grep.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'csexton/rvm.vim'
NeoBundle 'ujihisa/rdoc.vim'
NeoBundle 'vim-scripts/taglist.vim.git'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/nerdtree'

filetype plugin on
filetype indent on

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" 行番号の設定
set number
set ruler
hi LineNr ctermfg=darkgrey ctermbg=black

" フォント設定
set guifont=Bitstream\ Vera\ Sans\ Mono:h14

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
nnoremap <silent><Space>n :tabn<CR>
nnoremap <silent><Space>p :tabp<CR>
nnoremap <silent><Space>k :tabnew<CR>

" タブを閉じる
map <C-Q> :q<CR>

" -------------------------------------------------
" Unite.vim
" -------------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1

" buffers
nnoremap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>

" file list
nnoremap <silent> <C-u><C-f> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file<CR>

" bookmarks
nnoremap <silent> <C-u><C-k> :<C-u>Unite bookmark<CR>


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
" nerdtree.vim
" -------------------------------------------------
" ディレクトリツリーを開く
noremap <C-v><C-f> :NERDTree <CR>

" -------------------------------------------------
" Unite-tag
" -------------------------------------------------

" path にヘッダーファイルのディレクトリを追加することで
" neocomplcache が include 時に tag ファイルを作成してくれる
set path+=$LIBSTDCPP
set path+=$BOOST_LATEST_ROOT

" neocomplcache が作成した tag ファイルのパスを tags に追加する
function! s:TagsUpdate()
    " include している tag ファイルが毎回同じとは限らないので毎回初期化
    setlocal tags=
    for filename in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
        execute "setlocal tags+=".neocomplcache#cache#encode_name('tags_output', filename)
    endfor
endfunction

command! -nargs=? PopupTags call <SID>TagsUpdate() |Unite tag:<args>

function! s:get_func_name(word)
    let end = match(a:word, '<\|[\|(')
    return end == -1 ? a:word : a:word[ : end-1 ]
endfunction

" カーソル下のワード(word)で絞り込み
noremap <silent> g<C-]> :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" カーソル下のワード(WORD)で ( か < か [ までが現れるまでで絞り込み
" 例)
" boost::array<std::stirng... → boost::array で絞り込み
noremap <silent> G<C-]> :<C-u>execute "PopupTags " .substitute(<SID>get_func_name(expand('<cWORD>')), '\:', '\\\:', "g")<CR>
