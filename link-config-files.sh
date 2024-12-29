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

mkdir -p ~/.config/git
# mv ~/.config/git/ignore ~/.config/git/ignore.back.`date +%Y%m%d`
ln -s ~/dotfiles/dot-config-git-ignore ~/.config/git/ignore

ln -s ~/dotfiles/dot-config-starship.toml ~/.config/starship.toml

ln -s ~/dotfiles/.alacritty.toml ~/.alacritty.toml
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
mv ~/.config/zed/settings.json ~/.config/zed/settings.json.old
ln -s ~/dotfiles/dot-config-zed-settings.json ~/.config/zed/settings.json

# # Use BizinGothicNF instead of font-hackgen-nerd
# curl -OL https://github.com/yuru7/bizin-gothic/releases/download/v0.0.4/BizinGothicNF_v0.0.4.zip
# unzip -o BizinGothicNF_v0.0.4.zip
# open ~/dotfiles/BizinGothicNF_v0.0.4/BizinGothicDiscordNF-Bold.ttf
# open ~/dotfiles/BizinGothicNF_v0.0.4/BizinGothicDiscordNF-Regular.ttf
# open ~/dotfiles/BizinGothicNF_v0.0.4/BizinGothicNF-Bold.ttf
# open ~/dotfiles/BizinGothicNF_v0.0.4/BizinGothicNF-Regular.ttf

# https://marketplace.visualstudio.com/items?itemName=vscodevim.vim 
# To enable key-repeating, execute the following in your Terminal, log out and back in, and then restart VS Code:
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
