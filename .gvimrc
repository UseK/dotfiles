if has('gui_macvim')
	set noimdisableactivate "IME自動OFF
	" フォント設定
	set guifontwide=Menlo\ Regular:h12
	set guifont=Menlo\ Regular:h12
endif

if has('gui_macvim') || has('win32')
	set showtabline=2    " タブを常に表示
	set transparency=5   " 透明度
	"set noimdisableactivate "IME自動OFF
	set guioptions-=T    " ツールバー非表示
	set antialias        " アンチエイリアス
	"タブの幅をスペース二個分に
	set tabstop=2
	set shiftwidth=2
	set autoindent
  "自動改行の幅を0に
  set textwidth=0

	set number           " 行番号表示
	set nobackup         " バックアップなし
	set visualbell t_vb= " ビープ音なし

	colorscheme desert   " カラースキーマ
	"colorscheme elflord   " カラースキーマ
	"colorscheme murphy   " カラースキーマ
	"colorscheme murphy   " カラースキーマ
	"colorscheme koehler  " カラースキーマ
	"colorscheme evening  " カラースキーマ
	"colorscheme molokai  " カラースキーマ

	set columns=100      " 横幅
	set lines=35         " 行数

	set nowrapscan       " 検索をファイルの先頭へループしない

	"全角スペースを視覚化
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
	au BufNewFile,BufRead * match ZenkakuSpace /　/
	"他のアプリで日本語入力にしてもMacVimに戻ってくると英数に直す
	autocmd FocusGained * call feedkeys("\<ESC>\<ESC>\<ESC>:\<ESC>")
	filetype plugin indent on
endif
