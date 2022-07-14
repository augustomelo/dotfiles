@echo off

call :check_Permission

echo.
echo ****************************************************
echo *----------Windows Configuration Installer---------*
echo * Choose one of the following options:             *
echo *    1- Neovim-QT                                  *
echo *    2- GVim                                       *
echo *    3- Visual Code                                *
echo ****************************************************
echo.

set /P option="Option: "

goto case_%option%
:case_1
    echo Creating nvim folder under AppData
    mkdir %localappdata%\nvim
    cd %localappdata%\nvim
    echo Done!

    echo Creating autoload folder under nvim folder
    mkdir autoload
    echo Done!

    echo Downloading vim-plug
    ::Bitsadmin deprecated in favor of Start-BitsTransfer on Powershell.
    bitsadmin /transfer "Vim-Plug"^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim^
    %localappdata%\nvim\autoload\plug.vim
    echo Done!

    echo Creating a link to the file init.vim!
    mklink init.vim %userprofile%\workspace\dotfiles\neovim\init.vim
    echo Done!

    echo Creating a link to the file ginit.vim!
    mklink ginit.vim %userprofile%\workspace\dotfiles\neovim\ginit.vim
    echo Done!

    goto end_switch
:case_2
    cd %userprofile%

    echo Creating autoload folder under vimfiles folder
    mkdir vimfiles\autoload
    echo Done!

    echo Downloading vim-plug
    ::Bitsadmin deprecated in favor of Start-BitsTransfer on Powershell.
    bitsadmin /transfer "Vim-Plug"^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim^
    %userprofile%\vimfiles\autoload\plug.vim
    echo Done!

    echo Creating a link to the file vimrc!
    mklink .vimrc %userprofile%\workspace\dotfiles\vim\vimrc
    echo Done!

    echo Creating a link to the file gvimrc!
    mklink .gvimrc %userprofile%\workspace\dotfiles\vim\gvimrc
    echo Done!

    goto end_switch
:case_3
    echo Delete symbolic link settings
    del %appdata%\Code\User\settings.json

    echo Delete symbolic link keybindings
    del %appdata%\Code\User\keybindings.json

    echo Creating symbolic link settings
    mklink %appdata%\Code\User\settings.json %userprofile%\workspace\dotfiles\visualcode\settings.json

    echo Creating symbolic link keybindings
    mklink %appdata%\Code\User\keybindings.json %userprofile%\workspace\dotfiles\visualcode\keybindings.json

    echo Done!
:end_switch

pause


:check_Permission
net session>nul 2>&1
if %errorLevel% NEQ 0 (
    echo Admin permission is required!
    pause
    exit
)
goto:eof
