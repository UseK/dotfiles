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

filetype plugin off
filetype indent off
if has('vim_starting')
  "http://vim-users.jp/2011/10/hack238/
  "$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim.git
  "でインスコした後初期のNeoBundleInstallにはこっちのパスを使う
	"set runtimepath+=~/.vim/neobundle.vim.git
  set runtimepath+=~/.vim/.bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'

NeoBundle 'Shougo/neocomplete'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#min_syntax_length = 3
" ユーザ定義の辞書を指定
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/dotfiles/scala.dict',
  \ }

NeoBundle 'taichouchou2/vim-rsense'
let g:rsenseHome = "/Users/yf/.vim/rsense-0.3"
let g:rsenseUseOmniFunc = 1
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
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/error/close_on_empty' : 1,
      \ }
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
let g:quickrun_config['ruby.rspec'] = {
\ 'command': 'rspec',
\ 'exec': ['bundle exec %c %o %s %a']
\}
let g:quickrun_config.rspecl = {
\ 'type': 'ruby.rspec',
\ 'command': 'rspec',
\ 'exec': "bundle exec %c %s -l %{line('.')}",
\}
augroup RSpecQuickrun
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
nnoremap <Leader>rr :<C-u>QuickRun rspecl<CR>

NeoBundle 'endwise.vim'
"NeoBundle 'Smooth-Scroll'
"let g:scroll_factor = 5000
NeoBundle 'nathanaelkane/vim-indent-guides.git'
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#555555 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#444444 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'https://github.com/basyura/unite-rails.git'
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
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

NeoBundle 'https://github.com/szw/vim-tags'
NeoBundle 'https://github.com/thinca/vim-ref'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/ujihisa/unite-font.git'
NeoBundle 'https://github.com/thinca/vim-guicolorscheme.git'
NeoBundle 'desert.vim'
NeoBundle 'https://github.com/jiangmiao/simple-javascript-indenter.git'
NeoBundle 'https://github.com/vim-ruby/vim-ruby'
NeoBundle 'https://github.com/ktvoelker/sbt-vim.git'
NeoBundle 'thoughtbot/vim-rspec'
" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

NeoBundle 'https://github.com/ngmy/vim-rubocop.git'
NeoBundle 'https://github.com/rust-lang/rust.vim.git'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" 自分用 snippet ファイルの場所
let s:my_snippet = '~/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
call neobundle#end()
filetype plugin on
filetype indent on


let g:vimfiler_as_default_explorer = 1
