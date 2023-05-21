syntax on
"行末、行頭でカーソルが止まらない
set whichwrap=b,s,h,l,<,>,[,]
"バックスペースで何でも消す
set backspace=eol,start,indent
"コントロールコードを入力する時は
"Ctrl+Shift+vを入力してからコードを入力
"例：Ctrl+Shift+v Ctrl+hで^H
"ノーマルモードでもCtrl+hでバックスペース
nnoremap  X
"長い行において、表示行単位で移動する
noremap k gk
noremap j gj

"Ctrl+jで空行を挿入
nnoremap <C-j> :<C-u>call append(expand('.'), '')<Cr>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

"<TAB>の幅をスペース分個分で表示
set tabstop=2
"<TAB>入力でスペース二個分
set softtabstop=2
"vimの自動インデントでスペース二個分
set shiftwidth=2
"自動インデント
set autoindent
"タブボタンでスペースを入力
set expandtab
"viとの互換をoffに
set nocompatible
"ヤンクの内容をクリップボードにコピー
set clipboard=unnamed,autoselect
"行番号をつける
set number
"無駄なスペース１個分を見つけてハイライト
let ruby_space_errors=1
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"自動改行を行わない
set textwidth=0
"vモードで*で選択した範囲の文字列を検索する
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
"因みに選択した範囲の文字数をカウントするには「'<,'>s/./&/g」
"iTerms2のみ、インサートモード中にカーソルの形状を変える
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"
"inoremap <Esc> <Esc>gg`]

"Escの反応を早くする, zen-codingの連続押しもシビアになる
"set timeoutlen=200


" カーソル行を強調表示しない
"set nocursorline
" " 挿入モードの時のみ、カーソル行をハイライトする
"autocmd InsertEnter,InsertLeave * set cursorline!

"折りたたみを構文単位に
set foldmethod=syntax
set foldlevel=1
"コマンドをステータスラインに表示する
set showcmd
"Windowを右へ分割
set splitright

"source .neobundle.vimrc

let g:vimfiler_as_default_explorer = 1

colorscheme desert
