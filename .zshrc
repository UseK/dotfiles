# complete docker commands
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions:$fpath)
fi

# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# complete cargo commands
if type cargo &>/dev/null; then
  fpath=(~/.rustup/toolchains/stable-x86_64-apple-darwin/share/zsh/site-functions/_cargo:$fpath)
fi


#補間機能
autoload -U compinit
compinit

export EDITOR=/usr/bin/vim

#TmuxでもEmacsキーバインドが効くようにする
#この設定の前にカスタムのbindkeyを設定してしまうとtmuxで設定が元に戻るので注意
bindkey -e

#コマンドの履歴を保存，立ち上げてる各zshで共有
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history dataコマンドの履歴を保存

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^N" history-beginning-search-forward-end

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
    if type exa &>/dev/null; then
      alias ls="exa -F --icons"
    else
      alias ls="ls -GF"
    fi
    ;;
  linux*)
    alias ls="ls -F --color"
    ;;
esac

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
fg(){
  find . -type f -name $1 | xargs grep  -H -n --color $2
}

alias be='bundle exec'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ansible_ping='ansible testserver -m ping'
alias ansible_uptime='ansible testserver -m command -a uptime'
alias ansible_tail='ansible testserver -a "tail /var/log/dmesg"'
alias ansible_suto_tail='ansible testserver -s -a "tail /var/log/syslog"'
alias ansible_install_nginx='ansible testserver -s -m apt -a "name=nginx update_cache=yes"'
alias ansible_restart_nginx='ansible testserver -s -m service -a "name=nginx state=restarted"'

load_if_exists () {
  if [ -e $1 ]; then
    source $1
  fi
}
load_if_exists "$HOME/.zshrc_local"


if type starship &>/dev/null;
then
  eval "$(starship init zsh)"
else
  #${fg[色指定]}と${reset_color}で囲んだ部分がカラー表示になる。
  autoload colors
  colors
  #プロンプトにカレントディレクトリ，ユーザ名を２行で表示
  PROMPT="
  %F{yellow}%~%f
  $ "
  PROMPT2='[%n]> '

  #http://tkengo.github.io/blog/2013/05/12/zsh-vcs-info/ を参考
  autoload -Uz vcs_info
  setopt prompt_subst
  #%c(stagestrで指定した文字列)と
  #%u(unstagedstrで指定した文字列)をformatに使用可能にする。
  zstyle ':vcs_info:git:*' simple-use true
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "%F{green}M"
  zstyle ':vcs_info:git:*' unstagedstr "%F{red}M"
  zstyle ':vcs_info:*' formats "%F{white}%c%u[%b]%f"
  zstyle ':vcs_info:*' actionformats '[%b|%a]'
  precmd () { vcs_info }
  RPROMPT='${vcs_info_msg_0_}'
fi



alias git-rm-ignored='git ls-files --full-name -i --exclude-from=.gitignore | xargs git rm --cached'



if type exa &>/dev/null; then
  alias ll="exa -l --icons"
else
  alias ll='ls -alF'
fi

# not overwrite
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

function show_cpu_info_in_mac() {
  echo ">sysctl machdep.cpu.brand_string"
  sysctl machdep.cpu.brand_string
  echo ">system_profiler SPHardwareDataType"
  system_profiler SPHardwareDataType
}

function show_os_info_in_mac() {
  echo ">sw_vers"
  sw_vers
  echo ">uname -a"
  uname -a
}

export PATH=$HOME/.cargo/bin:${PATH}
source ~/.cargo/env

# cache when compile rust program
# https://github.com/mozilla/sccache
if type sccache &>/dev/null; then
  export RUSTC_WRAPPER=$(which sccache)
fi

function nkf-w-d--overwrite() {
nkf -w -d --overwrite $1
}
alias sbt-new='sbt new scala/scala-seed.g8'
alias ssh-keygen-l-f "ssh-keygen -l -f"


if type docker &>/dev/null; then
  function show_docker_ipaddress() {
    docker container inspect $1 --format {{'.NetworkSettings.IPAddress'}}
  }
fi

# https://minikube.sigs.k8s.io/docs/start/
if type kubectl &>/dev/null; then
  if type minikube &>/dev/null; then
    alias kubectl="minikube kubectl --"
  fi
fi


# All commands have been installed with the prefix "g".
# If you need to use these commands with their normal names, you
# can add a "gnubin" directory to your PATH from your bashrc like:
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"


# $ brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if type pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi

if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

alias cargo-generate-wasm-pack-template="cargo generate --git https://github.com/rustwasm/wasm-pack-template"
export PATH="$HOME/workspace/cli/node-cli/node_modules/.bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
