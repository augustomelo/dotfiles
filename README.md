# Dotfiles

## Install

This configuration relies on nix and home-manager, to install you will need to install using the determina installer: 

1. `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
    - On mac the command should be the following, because of encryption problem ([DeterminateSystems/nix-installer#891](https://github.com/DeterminateSystems/nix-installer/issues/891) ): `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install macos`
1. Create a symbolic link for the home-manager folder under the
   $XDG_CONFIG_HOME (note that the XDG_CONFIG_HOME might not be available):
    `ln -s $HOME/workspace/personal/dotfiles/home-manager/ $HOME/.config/home-manager/`
1. Install home-manager by `nix run github:nix-community/home-manager -- switch --flake .`, this will run home-manager as well

Just need to create a symbolic link to home-manager under $XDG_CONFIG_HOME and

### Notes

Regarding the vale, oto configure other spelling dictionaries besides english, will need to do:

1. [Configure spelling](https://vale.sh/docs/topics/styles/#spelling) 
1. [Download spelling (*.dic and *.aff)](https://github.com/wooorm/dictionaries/tree/main/dictionaries) 

### MacOS nice to have 

```
# Ctrl + Cmd + Click to move window
defaults write -g NSWindowShouldDragOnGesture -bool true

# to disable
defaults delete -g NSWindowShouldDragOnGesture

# allow close finder
defaults write com.apple.finder QuitMenuItem -bool true

# need to restart afterwards 
``
