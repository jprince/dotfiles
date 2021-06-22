# Dotfiles
## Sync git
```sh
ln -sv ~/DEV/dotfiles/git/config ~/.gitconfig
```

## Sync vscode
```sh
mkdir ~/.vscode
ln -sv ~/DEV/dotfiles/vscode/argv.json ~/.vscode/argv.json
ln -sv ~/DEV/dotfiles/vscode/bin ~/.vscode
ln -sv ~/DEV/dotfiles/vscode/extensions ~/.vscode
ln -sv ~/DEV/dotfiles/vscode/settings.json /Users/josh/Library/Application\ Support/Code/User/settings.json
ln -sv ~/DEV/dotfiles/vscode/keybindings.json /Users/josh/Library/Application\ Support/Code/User/keybindings.json

// Temp insiders beta release
ln -sv ~/DEV/dotfiles/vscode/settings.json /Users/josh/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
ln -sv ~/DEV/dotfiles/vscode/keybindings.json /Users/josh/Library/Application\ Support/Code\ -\ Insiders/User/keybindings.json
```

## Sync zsh
After installing oh-my-zsh: https://ohmyz.sh/#install, run
```shA
ln -sv ~/DEV/dotfiles/zshrc/zshrc ~/.zshrc
```
