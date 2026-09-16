#!/usr/bin/env bash
#
# wallpaper-rotate.sh
#
# Picks a random image from macOS's built-in wallpaper collection and sets
# it as the desktop picture on every display. Spaces share one desktop
# picture by default (unless a Space has its own custom picture assigned),
# so this covers all Mission Control desktops too.
#
# Run on a schedule via the com.aclark4life.wallpaper-rotate LaunchAgent
# installed by macos-system-preferences.sh.

set -uo pipefail

WALLPAPER_DIR="/System/Library/Desktop Pictures"

images=()
while IFS= read -r -d '' f; do
  images+=("$f")
done < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.heic" -o -iname "*.jpg" -o -iname "*.png" \) -print0)

if [[ ${#images[@]} -eq 0 ]]; then
  echo "wallpaper-rotate: no images found in $WALLPAPER_DIR" >&2
  exit 1
fi

picked="${images[$RANDOM % ${#images[@]}]}"
osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"${picked}\""
