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
- [X] C-A is not working because Nerdcommenter
- [ ] Add some keymaps for handling git
- [ ] I should have a look on the pugins for nvim-cmp they seem to have useful completion source, like:
  - Plug 'hrsh7th/cmp-buffer': source buff words
  - Plug 'hrsh7th/cmp-path': source for path
  - Plug 'hrsh7th/cmp-cmdline' source vim's cmdline
  - [more](https://github.com/topics/nvim-cmp) 
- [ ] vnip and cmp, how to jump to the next place holder
- [ ] nvim-cpm display docs as well
- [ ] improve startup time, maybe this could help: https://alpha2phi.medium.com/neovim-for-beginners-performance-95687714c236
- nvim 8
  - [ ] vim.o.command_height: maybe use something like https://github.com/folke/noice.nvim for the commandline
  - [ ] vim.o.winbar: move the file name from the status line to the top bar
  - [ ] vim.lsp.buf.format(): when saving a file
  - [ ] more cool stuff: https://github.com/neovim/neovim/releases/tag/v0.8.0
- [ ] Improve wildignore, for example .github is being hidden

### ZSH
- [ ] Integrate some useful scripts
- [ ] Add autocompletion missing
  - [ ] kubernetes 

### TMUX
- [ ] Improve statusline
