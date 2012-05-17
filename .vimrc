"色分け
syntax on
"行末、行頭でカーソルが止まらない
set whichwrap=b,s,h,l,<,>,[,]
"セミコロンでコマンド
noremap ; :
noremap : ;
set backspace=eol,start,indent
"タブの幅をスペース二個分に
set tabstop=2
set shiftwidth=2
set autoindent
"viとの互換をoffに
set nocompatible
"vim-rubyのための設定
filetype on
filetype indent on
filetype plugin on
"無駄なスペース１個分を見つけてハイライト
let ruby_space_errors=1
"行番号をつける
set number
"ほかのタブへコピペするプラグイン"
"map sy :call YanktmpYank()<CR>
"map sp :call YanktmpPaste_p()<CR>
"map sP :call YanktmpPaste_P()<CR>
set clipboard=unnamed,autoselect
"vundle用
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
Bundle 'neocomplcache'
