#補間機能
autoload -U compinit
compinit

#コマンドの履歴を保存，立ち上げてる各zshで共有
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history dataコマンドの履歴を保存

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#プロンプトにカレントディレクトリ，ユーザ名を２行で表示
autoload colors
colors
#Git
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="
%{${HOST}:${fg[yellow]}%}%~%{${reset_color}%}
%F{green}%1v%f[%n]$ "
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
#ctagsはhomebrewの使おう
#alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'


# home brewのパスを優先するように
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#rvmインスコ
#bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
#rvmのためにLLVM使わない
#brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb[
#alias gcc='gcc-4.2'
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

#bindkey -v
