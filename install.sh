#!/bin/bash
header='Terminal Tools Configuration Installer\n
        Select each desired option to install\n
        and hit Done:'

choice () {
    local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=✔
    fi
}

PS3='Select your choices: '
while :
do
    clear
    echo -e $header
    options=("Bash ${opts[1]}" "Vim \(not availabre yet\) ${opts[2]}" "Neovim ${opts[3]}" "Tmux ${opts[4]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Bash ${opts[1]}")
                choice 1
                break
                ;;
            "Vim ${opts[2]}")
                #choice 2
                break
                ;;
            "Neovim ${opts[3]}")
                choice 3
                break
                ;;
            "Tmux ${opts[4]}")
                choice 4
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

printf '%s\n' 'Options chosen:'
for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
        case $opt in
            1)
                echo "Installing Bash configs"
                if [ -f ~/.bashrc ]
                then
                    mv ~/.bashrc ~/.bashrc.old
                    echo "old bashrc backed up with *.old extension"
                fi
                if [ ! -d ~/.oh-my-bash ]
                then
                    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
                    echo "installed oh-my-bash"
                fi
                cp ./bash.conf ~/.bashrc
                . ~/.bashrc
                echo "bashrc installed"
                if [ ! -x "$(command -v fzf)" ]
                then
                    echo "Package fzf must be installed"
                fi
                ;;
            2)
                #echo "Installing Vim configs"
                #if [ -f ~/.vimrc ]
                #then
                #    mv ~/.vimrc ~/.vimrc.old
                #    echo "old vimrc backed up with *.old extension"
                #fi
                #cp ./vim.conf ~/.vimrc
                ;;
            3)
                echo "Installing Neovim configs"
                if [ -f ~/.config/nvim/init.vim ]
                then
                    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.old
                    echo "old Neovim's init.vim backed up to *.old extension"
                fi
                if [ ! -d ~/.config/nvim ]
                then
                    mkdir ~/.config/nvim
                    echo "created configurations directory on ~/.config/nvim"
                fi
                cp ./neovim.conf ~/.config/nvim/init.vim
                if [ ! -f ~/.config/nvim/autoload/plug.vim  ]
                then
                    echo "installing vim-plug as Plugin Manager for Neovim"
                    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    echo "installed vim-plug"
                fi
                nvim +PlugInstall +qall
                echo "plugins installed!"
                ;;
            4)
                echo "Installing Tmux configs"
                if [ -f ~/.tmux.conf ]
                then
                    mv ~/.tmux.conf ~/.tmux.conf.old
                    echo "old tmux.conf backed up with *.old extension"
                fi
                cp ./tmux.conf ~/.tmux.conf
                if [ ! -d ~/.tmux/plugins/tpm ]
                then
                    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
                fi
                echo "to install Tmux plugins run Prefix + I (default Prefix is c-x)"
                ;;    
        esac
    fi
done
