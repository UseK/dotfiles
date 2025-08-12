if status is-interactive
  fish_add_path $HOME/.cargo/bin
  # Use commands installed with pip
  fish_add_path $HOME/Library/Python/3.9/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # https://developer.1password.com/docs/cli/reference/#shell-completion
  if type op &>/dev/null;
    op completion fish | source
  end
  # Commands to run in interactive sessions can go here
  starship init fish | source
  zoxide init fish | source
  if type eza &>/dev/null;
    alias ls="eza -F --icons auto"
    alias ll="eza -F --icons auto -l"
  else
    alias ls="ls -GF"
    alias ll="ls -lGF"
  end
  if type bat &>/dev/null;
    alias cat="bat -pp"
  end
  eval (zellij setup --generate-auto-start fish | string collect)
end

if status --is-login
end

function show_cpu_info_in_mac
  echo ">sysctl machdep.cpu.brand_string"
  sysctl machdep.cpu.brand_string
  echo ">system_profiler SPHardwareDataType"
  system_profiler SPHardwareDataType
end

function show_os_info_in_mac
  echo ">sw_vers"
  sw_vers
  echo ">uname -a"
  uname -a
end
# https://docs.volta.sh/guide/getting-started
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
