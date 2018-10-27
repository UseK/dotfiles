export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim"
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
#フルスクリーンでもデュアルディスプレイが有効
defaults write org.vim.MacVim MMNativeFullScreen 0


# home brewのパスを優先するように
export PATH=/usr/local/bin:/usr/lobal/sbin:$PATH

#path for rsruby
export R_HOME=/Library/Frameworks/R.framework/Resources

alias x11="/Applications/Utilities/XQuartz.app/Contents/MacOS/X11"
export GNUTERM=X11

export RSENSE_HOME="$HOME/.vim/rsense-0.3"

export PATH="$HOME/.cargo/bin:$PATH"
