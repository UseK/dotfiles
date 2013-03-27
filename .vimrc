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
NeoBundle 'taichouchou2/vim-rsense'
let g:rsenseHome = "/Users/yf/.vim/rsense-0.3"
"let g:rsenseUseOmniFunc = 1
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
"~/.vim/.bundle/vimproc まで移動して$make -f make_mac.mak

"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
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
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
let g:user_zen_settings = { 'indentation':'  ' }
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
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'JavaScript-syntax'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
filetype plugin on
filetype indent on

let g:vimfiler_as_default_explorer = 1
