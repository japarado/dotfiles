picom_pid=$(pgrep picom)
echo $picom_pid;
if [[ -z $picom_pid ]]; then 
	picom -b --config ~/.config/picom/picom.conf --experimental-backends
else 
	killall -q picom;
fi
