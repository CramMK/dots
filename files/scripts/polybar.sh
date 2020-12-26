killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for mon in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $mon = "eDP"  ]; then
      MONITOR=$mon polybar --reload laptop &
    else
#      MONITOR="DP-3" polybar --reload desktop &
      MONITOR="HDMI-1" polybar --reload desktop &
#      MONITOR="DP-1" polybar --reload desktop_second &
    fi
  done
else
    echo "No Bars loaded."
fi
