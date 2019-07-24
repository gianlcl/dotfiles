echo "1:default-one ($SHELL)"; cat /etc/shells | grep -n -v '^#'
SELECTED=$(read x; sed -n "$x p" /etc/shells)
echo $SELECTED

sed "s/\(DOT_SHELL=\"\)[^\"]*/\1$SELECTED/" tmux.conf | head -n10 > out.dev
