
echo
echo "****************************************************"
echo "*-----------Linux Configuration Installer----------*"
echo "* Choose one of the following options:             *"
echo "*    1- Bashrc                                     *"
echo "*    2- Neovim                                     *"
echo "*    3- Neovim-QT                                  *"
echo "*    4- Vim                                        *"
echo "*    5- GVim                                       *"
echo "****************************************************"
echo

read option

case "$option" in
    1)
        echo "Creating link bashrc"
        ln -s "$(pwd)/bash/.bashrc" ~/.bashrc
        echo "Done!"
        ;;

    2)
        echo "Creating nvim folder under config"
        mkdir ~/.config/nvim
        echo "Done!"

        echo "Creating autoload folder under config"
        mkdir ~/.config/nvim/autoload
        echo "Done!"

        echo "Downloading vim-plug"
        curl -fLo ~/.config/nvim/autoload/plug.vim \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "Done!"

        echo "Creating link to init.vim"
        ln -s "$(pwd)/neovim/init.vim" ~/.config/nvim/init.vim
        echo "Done!"
        ;;

    3)
        echo "Creating nvim folder under config"
        mkdir ~/.config/nvim
        echo "Done!"

        echo "Creating autoload folder under config"
        mkdir ~/.config/nvim/autoload
        echo "Done!"

        echo "Downloading vim-plug"
        curl -fLo ~/.config/nvim/autoload/plug.vim \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "Done!"

        echo "Creating link to init.vim"
        ln -s "$(pwd)/neovim/init.vim" ~/.config/nvim/init.vim
        echo "Done!"

        echo "Creating link to ginit.vim"
        ln -s "$(pwd)/neovim/ginit.vim" ~/.config/nvim/ginit.vim
        echo "Done!"
        ;;

    4)
        echo "Creating .vim folder under home"
        mkdir ~/.vim
        echo "Done!"

        echo "Creating autoload folder under .vim"
        mkdir ~/.vim/autoload
        echo "Done!"

        echo "Downloading vim-plug"
        curl -fLo ~/.vim/autoload/plug.vim \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "Done!"

        echo "Creating link to .vimrc"
        ln -s "$(pwd)/vim/.vimrc" ~/.vimrc
        echo "Done!"

        ;;

    5)
        echo "Creating .vim folder under home"
        mkdir ~/.vim
        echo "Done!"

        echo "Creating autoload folder under .vim"
        mkdir ~/.vim/autoload
        echo "Done!"

        echo "Downloading vim-plug"
        curl -fLo ~/.vim/autoload/plug.vim \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "Done!"

        echo "Creating link to .vimrc"
        ln -s "$(pwd)/vim/.vimrc" ~/.vimrc
        echo "Done!"

        echo "Creating link to .gvimrc"
        ln -s "$(pwd)/vim/.gvimrc" ~/.gvimrc
        echo "Done!"
        ;;
esac



