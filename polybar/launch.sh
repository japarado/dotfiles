killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=DP-0 polybar --reload left &
MONITOR=DP-4 polybar --reload right &

echo "Polybar launched..."
