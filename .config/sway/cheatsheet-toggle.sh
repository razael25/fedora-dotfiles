#!/bin/bash
# Toggle cheatsheet as floating box (sway + foot)
CHEAT="$HOME/Documents/sway-cheatsheet.md"

# If window already exists -> toggle show/hide via scratchpad
if swaymsg -t get_tree | jq -e '.. | objects | select(.app_id == "cheatsheet")' > /dev/null; then
    swaymsg '[app_id="cheatsheet"] scratchpad show'
else
    foot -a cheatsheet -T cheatsheet -W 110x35 glow -p "$CHEAT" &
fi
