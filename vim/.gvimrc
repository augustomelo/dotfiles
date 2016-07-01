" ------- GVIM
" Hide toolbar vim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" Start window size
set lines=50 columns=100
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ for\ Powerline\ Bold\ 11,Inconsolata\ Bold\ 11
        cd ~/workspace
    elseif has("gui_win32")
        cd ~\workspace
        set guifont=DejaVuSansMonoForPowerline_NF:h9:b,DejaVuSansMonoForPowerline_Nerd:h9:b,Consolas:h10:b
        "Better font rendering
        if (v:version == 704 && has("patch393")) || v:version > 704
            set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
        endif
		highlight Comment gui=none
		highlight String gui=none
		highlight StatusLine gui=none
    endif
endif
