# Monitor the currently active workspace on the focused monitor
while true; do
  active_workspace=$(hyprctl activeworkspace -j | jq '.id')
  echo "$active_workspace"
  sleep 1
done
