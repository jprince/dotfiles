# Dotfiles
## Syncing
### Git
```sh
ln -sv ~/DEV/dotfiles/git/config ~/.gitconfig
```

### zsh
After installing oh-my-zsh: https://ohmyz.sh/#install, run
```sh
ln -sv ~/DEV/dotfiles/zshrc/zshrc ~/.zshrc
```

### Claude
1. Copy the desired file/directory to the dotfiles repo:
```sh
cp -R ~/.claude/skills ~/DEV/dotfiles/claude/skills
```
2. Delete the original file/directory:
```sh
rm -rf ~/.claude/skills
```
3. Create a symlink to the dotfiles repo:
```sh
ln -s ~/DEV/dotfiles/claude/settings.json ~/.claude/settings.json
ln -s ~/DEV/dotfiles/claude/hooks ~/.claude/hooks
ln -s ~/DEV/dotfiles/claude/skills ~/.claude/skills
```
