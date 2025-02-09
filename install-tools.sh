
# bat bottom dust eza gh git git-delta git-secrets gnu-sed go grype jq libmpc mysql poetry procs qemu reattach-to-user-namespace sbom-tool starship syft veeso/termscp/termscp volta xeol zellij zoxide

brew install bat bottom dust eza git git-delta git-lfs git-secrets gnu-sed jq starship zellij zoxide volta fish 1password-cli
git lfs install

brew install --cask 1password alfred dropbox firefox rectangle alacritty discord karabiner-elements visual-studio-code slack zed obs

# No Use
# brew install --cask google-japanese-ime font-hackgen-nerd

# To Develop Zed
# https://zed.dev/docs/development/macos#troubleshooting
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

volta install node@20

# https://www.rust-lang.org/ja/learn/get-started
if !type rustup &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi