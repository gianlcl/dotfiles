# Changing default shell
tmux_shell () {
	echo "1:default-one ($SHELL)"; cat /etc/shells | grep -n -v '^#'
	echo -n "Select default shell: "; read choice
	SELECTED=$(sed -n "$choice p" /etc/shells)
	if [ $choice = '1' ]; then
	    sed -i "s|\(DOT_SHELL=\"\)[^\"]*|\1\$SHELL|" tmux.out
	else
	    sed -i "s|\(DOT_SHELL=\"\)[^\"]*|\1$SELECTED|" tmux.out
	fi
}

# Changing prefix keybinding
tmux_prefix () {
    header='Tmux commands uses a Prefix keybinding
            by default the Prefix is Ctrl+b ( C-b )
            If you want to change the default Prefix
            Enter a new one, otherwise leave it blank to keep default.
            TIPS:   C- means Ctrl key
                    M- means Meta key
                    <space> means spacebar
                    ex: C-<space> to use Ctrl+Spacebar as Prefix'

    echo -e "$header"
	echo -n "Prefix key binding: "; read choice
	sed -i "s|\(DOT_TMUX_PREFIX=\"\)[^\"]*|\1$choice|" tmux.out
}

# Changing default theme and powerline
#install_powerline () {
#
#}

# Main function
main () {
	# Create new config file based on template
	cp tmux.conf tmux.out
	
    tmux_shell
    
    tmux_prefix

	# Dev Out Print
	cat tmux.out | head -n10
}

main
