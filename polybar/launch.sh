#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# killall -q xfce4-clipman
# killall -q optimus-manager-qt

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar -l --reload main &
fi

echo "Polybar launched..."
