syntax on
"行末、行頭でカーソルが止まらない
set whichwrap=b,s,h,l,<,>,[,]
"セミコロンでコマンド
noremap ; :
noremap : ;
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
"タブの幅をスペース二個分に
set tabstop=2
set shiftwidth=2
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
"コマンドをステータスラインに表示する
set showcmd

filetype plugin off
filetype indent off
if has('vim_starting')
  "http://vim-users.jp/2011/10/hack238/
  "$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim.git
  "でインスコした後初期のNeoBundleInstallにはこっちのパスを使う
	"set runtimepath+=~/.vim/neobundle.vim.git
  set runtimepath+=~/.vim/.bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/.bundle'))
endif
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"vim-railsとの衝突を解消
let g:neocomplcache_force_overwrite_completefunc = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"NeoBundle 'Shougo/neocomplete'
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#force_overwrite_completefunc = 1
"Rubyスクリプトの編集中は.等を押下したタイミングでvimのオムニ補完を効かせる
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
NeoBundle 'taichouchou2/vim-rsense'
let g:rsenseHome = "/Users/yf/.vim/rsense-0.3"
"let g:rsenseUseOmniFunc = 1
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
"~/.vim/.bundle/vimproc まで移動して$make -f make_mac.mak

"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'

NeoBundle 'thinca/vim-quickrun.git'
let g:quickrun_config = {}
"vimpricで非同期実行
let g:quickrun_config._ = {'runner' : 'vimproc'}
"Markedアプリと連携
let g:quickrun_config.markdown = {
  \ 'outputter' : 'null',
  \ 'command' : 'open',
  \ 'cmdopt' : '-a',
  \ 'args' : 'Marked',
  \ 'exec' : '%c %o %a %s',
  \ }
"CofeeScriptのコンパイル結果を表示
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
NeoBundle 'endwise.vim'
"NeoBundle 'Smooth-Scroll'
"let g:scroll_factor = 5000
"NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/reinh/vim-rubytest.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'dbext.vim'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'https://github.com/mattn/emmet-vim'
NeoBundle 'JavaScript-syntax'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/szw/vim-tags'
NeoBundle 'https://github.com/thinca/vim-ref'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/ujihisa/unite-font.git'
NeoBundle 'https://github.com/thinca/vim-guicolorscheme.git'
NeoBundle 'desert.vim'
filetype plugin on
filetype indent on

let g:vimfiler_as_default_explorer = 1
