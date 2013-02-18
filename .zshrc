#補間機能
autoload -U compinit
compinit
#プロンプトにカレントディレクトリ，ユーザ名を２行で表示
autoload colors
colors
PROMPT="
%{${HOST}:${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "

PROMPT2='[%n]> ' 

#ターミナルのタイトルを「ユーザ名@ホスト名」に
case "${TERM}" in
  kterm*|xterm)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac
#色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'
#alias
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

#MacVimの設定
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'

# home brewのパスを優先するように
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#rvmインスコ
#bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
#rvmのためにLLVM使わない
#brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb[
alias gcc='gcc-4.2'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
