echo "1:default-one ($SHELL)"; cat /etc/shells | grep -n -v '^#'
echo -n "Select default shell: "; read choice
SELECTED=$(sed -n "$choice p" /etc/shells)
# echo $choice $SELECTED

if [ $choice = '1' ]; then
    sed "s|\(DOT_SHELL=\"\)[^\"]*|\1\$SHELL|" tmux.conf | head -n10
else
    sed "s|\(DOT_SHELL=\"\)[^\"]*|\1$SELECTED|" tmux.conf | head -n10
fi

echo -n "Prefix key binding: "; read choice
sed "s|\(DOT_TMUX_PREFIX=\"\)[^\"]*|\1$choice|" tmux.conf | head -n10
