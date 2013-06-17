" 文字コードの自動認識
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = s:fileencodings_default .','. &fileencodings
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
endif
" }}}

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
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'tsukkee/unite-tag.git'
NeoBundle 'fuenor/qfixgrep.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'thinca/vim-fontzoom.git'
NeoBundle 'Lokaltog/vim-powerline.git'
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
NeoBundle 'vim-scripts/taglist.vim.git'

filetype plugin on
filetype indent on

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
" vim-fugitive
" -------------------------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
nnoremap <silent> <C-@> :call<Space>ToggleGstatus()<CR>
function! ToggleGstatus()
  if bufexists(".git/index")
    execute "bw .git/index"
  else
    execute "Gstatus"
  endif
endfunction

" -------------------------------------------------
" VimFiler.vim
" -------------------------------------------------
" 画面分割して開く
noremap <C-v><C-f> :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" qfixApp
set runtimepath+=~/.vim/plugins/qfixapp
let QFixHowm_Key = 'g'
let howm_dir             = '~/howm_dir'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.markdown'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'

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
