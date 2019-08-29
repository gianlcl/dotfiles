#!/bin/bash
# check whether whiptail or dialog is installed
# (choosing the first command found)
read dialog <<< "$(which whiptail dialog 2> /dev/null)"
# exit if none found
[[ "$dialog" ]] || {
  echo 'neither whiptail nor dialog found' >&2
  exit 1
}
# Program VARS
PROGRAM_NAME='Dotfile Installer'
FLAG_BASH=false
FLAG_ZSH=false
FLAG_TMUX=false
FLAG_NVIM=false

# 
msg='Select desired options to install.'
cmd=($dialog --separate-output --checklist --title "$PROGRAM_NAME" "$msg" 0 0 0)
options=(1 "Bash" off    # any option can be set to default to "on"
         2 "Zsh" off
         3 "Tmux" off
         4 "Neovim" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
printf '%s\n' 'Options chosen: '
for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done


