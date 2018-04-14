# Neovim

## Index
* [Editor](#editor)
    * [Buffer](#buffer)
    * [Command](#command)
    * [Diff](#diff)
    * [General](#general)
    * [Macro](#macro)
    * [Mark](#mark)
    * [Movement](#moviment)
    * [Search](#search)
    * [Spell Checking](#spell-checking)
    * [Tab](#tab)
    * [Window](#windo)
* [Plugins](#plugins)
    * [NERDTree](#nerdtree)
    * [CtrlP](#ctrlp)
    * [Surround](#surround)
    * [NERD Commenter](#nerd-commenter)
    * [TagBard](#tagbar)
    * [OmniSharp](#omnisharp)

## Editor
### Buffer
`:bn` Next buffer.  
`:bp` Previous buffer.  
`:bw` Wipe buffer.  
`:bufdo (command)` Runs a command on all buffers.  
`:.+,$bwipeout` Wipe all buffers except the current one.  

### Command
`q:` Command window history.  
`q\` Search window history.  

### Diff
`:diffsplit (filename)` Diff current and the newly opened filename.  
`:diffthis` Diff current window.  
`:diffoff` Turn off diff.  

### Fold
`zc` Close current fold.  
`zM` Close all folds.  
`zR` Open all folds.  
`zO` Open current fold recursively.  

### General
`:norm (command)` Execute a normal mode command.  
`:retab!` Can be use to convert spaces to tab and vice versa.  
`:sort` Sort lines.  
`:vim[grep][!] /{pattern}/[g][j] {dir}` Search a pattern in files across the directories.  
`e!` Restore original file.  
`c-a` Increment a number.  
`c-x` Decrement a number.  
`nvim -u NONE` Start Neovim without configuration.  
`g+` Go to newer text state on history tree.  
`g-` Go to older text state on history tree.  
`:erlier {N}s` Go to the older text state about {N} seconds before.  
`:syntime` Verify what is taking long to redraw on the syntax.  
`gqq` Format the current by the text width value.  
`redir @{a-Z}` Redirect a command to a register.  
`redir END` Ends the redirect command.  
`uniq()` Remove equals entries, Ex.: `:1,$!uniq`  
`C-v u1234` Inserts a unicode character  

### Macro
`"qp` Paste the contents of the register to the current cursor position.  
`"qyy` Yank the contests of the line to the register, or can use `let @q='`.  

### Mark
`m(character)` Set a mark to a specific character.  
`'(character)` Jump to mark.  

### Movement
`gJ` Concatenate lines without space.  
`g;` Move back the change list.  
`g,` Move forwards the change list.  
`[m` Go to previous start of method.  
`[{` Go to previous unmatched `{`.  

### Search
`$` End of the line.  
`@!` Negative assertion (lookahead).  
`@<!` Negative assertion (lookbehind).  
`\0` Reuse part of the search at the replace.  
`\z(s|e)` Starts/end match.  
`\(C|c)` Force case sensitive/insensitive.  
`\u` Uppercase next letter in replacement.  
`\l` Lowercase next letter in replacement.  
`\U` Uppercase replacement from here on (until \e or \E).  
`\L` Lowercase replacement from here on (until \e or \E).  

### Spell Checking
`z=` Show a list of suggestions for the word under the cursor.  
`C-x` Same as z= but in insert mode (after a badly spelled word).
`zg` Add word under the cursor as good.  
`zw` Add word under the cursor as bad.  
`zug` Undo `zg`.  
`zuw` Undo `zw`.  

### Tab
`Gt` Move to the next tab.  
`gT` Move to previous tab.  
`#gt` Move to tab number.  

### Window
`c-w _` Set current window to the max height.  
`c-w |` Set current window to the max width.  
`c-w [HJKL]` Move window to the position.  
`c-w x` Exchange current window with its neighbor.  
`c-w r` Rotate all windows.  
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

### CtrlP
`c-v` Open on vertical split.  
`c-z` To mark/unmark multiple files and <c-o> to open them.  
`c-d` To switch to file name only search instead of full path.  
`c-f c-b` Cycle between modes.  

### Surround
`cs<from><to>` Change surround from to (remember t stands for tag).  

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