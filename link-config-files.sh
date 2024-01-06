# mv ~/.config/git/ignore ~/.config/git/ignore.back.`date +%Y%m%d`
ln -s ~/dotfiles/dot-config-git-ignore ~/.config/git/ignore
ln -s ~/dotfiles/dot-config-starship.toml ~/.config/starship.toml
mkdir -p ~/.hammerspoon
ln -s ~/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua