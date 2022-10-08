# Dot files

## Dependencies
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf) 



This are my dot files and cheatsheet, the better way to install this
configurations is through the install scripts

## Linux
./install.sh

## Windows
Run as admin install.bat

## Todo
### General
- [ ] use stow or other program to manage the dotfiles ([stow](https://www.gnu.org/software/stow/), [other utilities](https://dotfiles.github.io/utilities/) )

### Neovim
- [X] Better file browser with telescope-file-browser.nvim
- [X] Better pairs highlight, for example when working with lua the function is not highlighted
- [ ] Understand how to manage my words dictionary 
- [ ] C-A is not working because Nerdcommenter
- [ ] Add some keymaps for handling git
- nvim 8
  - [ ] vim.o.command_height: maybe use something like https://github.com/folke/noice.nvim for the commandline
  - [ ] vim.o.winbar: move the file name from the status line to the top bar
  - [ ] vim.lsp.buf.format(): when saving a file
  - [ ] more cool stuff: https://github.com/neovim/neovim/releases/tag/v0.8.0

### ZSH
- [ ] Integrate some useful scripts
