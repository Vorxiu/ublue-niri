# niri auto-login for tty1
# if [ "$XDG_VTNR" = 1 ] && [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "$TTY" = "tty1" ]; then
#   exec niri-session -l
# fi