# Shell

## Index
* [Commands](#commands)
* [Terminal](#terminal)
* [Git](#git)

## Commands
`netstat -atunp` List all ports TCP/UDP and show numbers and program.  
`find location comparison-criteria search-term` Find a file on a directory Ex.: `find . -name "test"`.  
`grep` Find a pattern in data Ex.: `grep -r --include=\*.{cpp,h} 'string'`.  
`du -sh <place>` Give the size of that place.  
`optirun -b none nvidia-settings -c :8 run nvidia-settings` Run Nvidia settings.  
`ntfsfix -bd /dev/sdXX` Fix common errors and forces windows to check NTFS.  
`fsck /dev/sdXX` Check and repair for a linux file system.  
`dd if=source of=destination bs=size status=progress` Write the data from the source to the destination, Ex.: `dd if=/dev/zero of=/dev/sdXX bs=1M status=progress`  
`fuser /dev/sdb` Identify process using files or sockets, Ex.: `fuser -kim /dev/sdb`  

## Terminal
`Ctrl + a` Go to the beginning of the line.  
`Ctrl + e` Go to the end of the line.  
`Ctrl + p` Previous command.  
`Ctrl + n` Next command.  
`Ctrl + w` Cut the word before the cursor to the clipboard.  
`Ctrl + k` Cut the line after the cursor to the clipboard.  
`Ctrl + u` Cut the line before the cursor to the clipboard.  
`Alt + d` Delete the word after the cursor.  
`Alt + b` Back (left) one word.  
`Alt + f` Forward (right) one word.  

## Git
`git diff --(staged|cached)` Difference between staged area and HEAD.  
`git checkout <file>` Rollback a file.  
`git reset HEAD <file>` Undo a file git add.  
`git stash` Stash the current state.  
`git stash list` List the stash.  
`git stash (pop|apply)` Pop remove a single stashed state from the stash list and apply it on top of the current working tree state. Apply do not remove the state.  
`git stash (drop|clear)` Drop remove a single state from the stash. Clear remove all states.  
`git log -p -1 <path>` Get the diff between the file now and existed before.  
