#!/bin/bash
export DISPLAY=:0

# Make sure XQuartz is running (cold start can take a few seconds).
if ! pgrep -x XQuartz >/dev/null 2>&1 && ! pgrep -f 'X11.bin' >/dev/null 2>&1; then
  open -a XQuartz
fi

# Wait for the X server to be ready to accept connections.
for i in $(seq 1 30); do
  /opt/X11/bin/xdpyinfo >/dev/null 2>&1 && break
  sleep 0.5
done

exec /opt/X11/bin/xeyes -geometry 300x400
