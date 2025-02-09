mkdir -p ~/.config/git
# mv ~/.config/git/ignore ~/.config/git/ignore.back.`date +%Y%m%d`
ln -s ~/dotfiles/dot-config-git-ignore ~/.config/git/ignore

ln -s ~/dotfiles/dot-config-starship.toml ~/.config/starship.toml

ln -s ~/dotfiles/.alacritty.toml ~/.alacritty.toml
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/dot-config-fish-config.fish ~/.config/fish/config.fish
mv ~/.config/zed/settings.json ~/.config/zed/settings.json.old
ln -s ~/dotfiles/dot-config-zed-settings.json ~/.config/zed/settings.json
ln -s ~/dotfiles/dot-config-zellij-config.kdl ~/.config/zellij/config.kdl
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
