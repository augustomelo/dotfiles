# Neovim

## Editor
### Buffer
`:b (name|number)` Go to buffer name/number.  
`:bn` Next buffer.  
`:bp` Previous buffer.  
`:bd` Buffer delete.  
`:bw` Wipe buffer.  
`:bufdo (command)` Runs a coomand on all buffers.  
`:.+,$bwipeout` Wipe all buffers except the current one.  
`c-^` Previous buffer (cycle between 2).  

### Command
`q:` Command window history.  
`q\` Search window history.  
`c-f` Bring a history of every command.  
`c-p` Previous command.  
`c-n` Next command.  

### Diff
`:diffsplit (filename)` Diff current and the newly opened filename.  
`:diffthis` Diff current window.  
`:diffoff` Turn off diff.  

### Fold
`za` Toggle current fold open/close.  
`zc` Close current fold.  
`zM` Close all folds.  
`zR` Open all folds.  
`zO` Open current fold recursively.  

### General
`:norm (command)` Execute a normal mode command.  
`:retab` Can be use to convert spaces to tab and vice versa.  
`:sort` Sort lines.  
`:vim[grep][!] /{pattern}/[g][j] {file}` Search a pattern in a file.  
`e!` Restore original file.  
`c-a` Increment a number.  
`c-x` Decrement a number.  
`ZZ` Save and quit.  
`Y` Yank the whole line .  
`{1}z=` First suggest correction misspelling.  
`nvim -u NONE` Start Neovim without configuration.  
`%:p:h` Expand to full path to the current location.  
`cc` Display error no quick fix list.  
`cn` Next occurrence in quick fix list.  
`cp` Previous occurrence in quick fix list.  
`ll` Display error on location list.  
`lN` Next occurrence in location list.  
`lp` Previous occurrence in location list.  
`g+` Go to newer text state on history tree.  
`g-` Go to older text state on history tree.
`:erlier {N}s` Go to the older text state about {N} seconds before.  

### Mark
`m(character)` Set a mark to a specific character.  
`'(character)` Jump to mark.  

### Movement
`gJ` Concatenate lines without space.  
`c-o` Jump back to previous location.  
`c-i` Jump to newer location.  
`g;` Move back the change list.  
`g,` Move forwards the change list.  

### Search
`$` End of the line.  
`@!` Negative assertion.  
`\0` Reuse part of the search at the replace.  
`\z(s|e)` Starts/end match.  
`\(C|c)` Force case sensitive/insensitive.  
`\u` Uppercase next letter in replacement.  
`\l` Lowercase next letter in replacement.  
`\U` Uppercase replacement from here on (until \e or \E).  
`\L` Lowercase replacement from here on (until \e or \E).  

### Tab
`Gt` Move to the next tab.  
`gT` Move to previous tab.  
`#gt` Move to tab number.  

### Window
`c-w |` Set current window width to N (default: highest possible).  
`c-w _` Set current window height to N (default: highest possible).  
`c-w t c-w H` Horizontally to vertically.  
`c-w x` Exchange current window with its neighbour.  
`c-w T` Move current split window into its own tab.  

## Plugins
### NERDTree
`B` Display  bookmark.  
`D` Delete bookmark.  
`cd` Change directory.  
`C` Show only changed directory.  
`?` Help.  
`s` Open vertical split.  
`go` Preview.  
`m` Modify.  

### CTRLP
`c-v` Open on vertical split.  
`c-z` To mark/unmark multiple files and <c-o> to open them.  
`c-d` To switch to file name only search instead of full path.  
`c-f c-b` Cycle between modes.  

### Surround
`cs<from><to>` Change surround from to (remember t stands for tag).  
`ds<>` Delete surround.  
`ys<text object, movement>` Insert surround.  
`S` on visual mode will insert the surrounding.  

### NERD Commenter
`[count]<leader>cc` Comment out the current line or text selected in visual mode.  
`[count]<leader>cu` Uncomments the selected line(s).  
`[count]<leader>c<space>` Toggles the comment state of the selected line(s).  
`[count]<leader>cs` Comments out the selected lines with a pretty block formatted layout.  

### TagBar
`<CR>` Jump to tag definition.  
`<Space>` Display tag prototype.  
`p` As above, but stay in Tagbar window.  
`P` Show tag in preview window.  
`s` Toggle sort.  
`x` Zoom window in/out.  
`q` Close window.  

### OmniSharp
`<S-A-F10>`  Fix issues and imports.  
`<F12>` Go to definition.  
`<leader>dc` Full documentation.  
`<leader><space>` Get code actions.  
`<F2>` Rename:
