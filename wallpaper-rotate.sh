#!/usr/bin/env bash
#
# wallpaper-rotate.sh
#
# Picks a random image from macOS's built-in wallpaper collection (plus
# /Library/Desktop Pictures and ~/Pictures/Wallpaper[s] if present) and sets
# it as the desktop picture on every display. Spaces share one desktop
# picture by default (unless a Space has its own custom picture assigned),
# so this covers all Mission Control desktops too.
#
# Run on a schedule via the com.aclark4life.wallpaper-rotate LaunchAgent
# installed by macos-system-preferences.sh.

set -uo pipefail

# Only plain image files are usable: the `.madesktop` bundles in
# /System/Library/Desktop Pictures are accepted by System Events but render
# as a solid color, so they're deliberately excluded.
WALLPAPER_DIRS=(
  "/System/Library/Desktop Pictures"
  "/Library/Desktop Pictures"
  "$HOME/Pictures/Wallpaper"
  "$HOME/Pictures/Wallpapers"
)

images=()
for dir in "${WALLPAPER_DIRS[@]}"; do
  [[ -d "$dir" ]] || continue
  while IFS= read -r -d '' f; do
    images+=("$f")
  done < <(find "$dir" -maxdepth 1 -type f \( -iname "*.heic" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0)
done

# Full-resolution stills for the newer (Sonoma/Tahoe) wallpapers live one
# level down in the hidden .wallpapers directory; the sibling .thumbnails
# directory only holds 356px previews, so it's skipped.
while IFS= read -r -d '' f; do
  images+=("$f")
done < <(find "/System/Library/Desktop Pictures/.wallpapers" -maxdepth 2 -type f -iname "*.heic" ! -iname "*Thumbnail*" -print0 2>/dev/null)

if [[ ${#images[@]} -eq 0 ]]; then
  echo "wallpaper-rotate: no images found in ${WALLPAPER_DIRS[*]}" >&2
  exit 1
fi

picked="${images[$RANDOM % ${#images[@]}]}"
osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"${picked}\""
