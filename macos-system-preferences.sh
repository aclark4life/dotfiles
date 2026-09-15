#!/usr/bin/env bash
#
# macos-system-preferences.sh
#
# Applies the "macOS System Preferences" settings documented at:
# https://github.com/aclark4life/setup#macos-system-preferences
#
# Usage: ./macos-system-preferences.sh
#
# Safe to re-run (idempotent). Some settings require sudo and will prompt.
# A few settings can't be safely scripted (see "Manual steps" at the end).

set -uo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
  echo "❌ This script only applies to macOS." >&2
  exit 1
fi

# Run a command, warning (not aborting) on failure so one protected/locked
# domain doesn't stop the rest of the script from applying.
run() {
  if ! "$@"; then
    echo "  ⚠️  Failed: $*" >&2
    return 1
  fi
}

# The com.apple.universalaccess domain is TCC-protected; Terminal (or your
# terminal app) needs "Full Disk Access" to write it. Detect this up front,
# open the correct System Settings pane, and wait for the user to grant it.
ensure_full_disk_access() {
  if defaults write com.apple.universalaccess __fda_test__ -bool true 2>/dev/null; then
    defaults delete com.apple.universalaccess __fda_test__ 2>/dev/null || true
    return 0
  fi

  echo "🔐 Full Disk Access is required to change Accessibility settings."
  echo "   Opening System Settings → Privacy & Security → Full Disk Access..."
  open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"
  echo "   Add/enable your terminal app (e.g. Terminal, iTerm) in the list,"
  echo "   then come back here."
  read -r "?   Press [Enter] once you've granted access (or Ctrl-C to skip)... "

  if defaults write com.apple.universalaccess __fda_test__ -bool true 2>/dev/null; then
    defaults delete com.apple.universalaccess __fda_test__ 2>/dev/null || true
    echo "   ✅ Full Disk Access confirmed."
    return 0
  fi

  echo "   ⚠️  Still can't write com.apple.universalaccess. You may need to fully quit"
  echo "   and reopen your terminal app after granting access. Continuing anyway..."
  return 1
}

echo "🖥  Applying macOS system preferences..."

ensure_full_disk_access

# --- Accessibility -----------------------------------------------------
# Zoom → Use scroll gesture with modifier keys: Control
echo "♿️ Accessibility: enabling scroll-to-zoom with ⌃ Control..."
if ! run defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true; then
  echo "  ℹ️  Grant Terminal 'Full Disk Access' in System Settings → Privacy & Security, then re-run." >&2
else
  run defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
  run defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144
fi

# --- Battery -------------------------------------------------------------
# Power Adapter → Turn display off: Never; Disable Power Nap
echo "🔋 Battery: display never sleeps on power adapter, Power Nap disabled..."
run sudo pmset -c displaysleep 0
run sudo pmset -c powernap 0

# --- Bluetooth -------------------------------------------------------------
# Show Bluetooth in menu bar
echo "🔵 Bluetooth: showing menu bar icon..."
run defaults -currentHost write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# --- Displays -------------------------------------------------------------
# Disable automatic brightness adjustment
echo "🖥  Displays: disabling automatic brightness..."
run sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Brightness Enabled" -bool false

# --- Dock -------------------------------------------------------------
# Don't show recent applications in the Dock
echo "🚢 Dock: hiding recent applications..."
run defaults write com.apple.dock show-recents -bool false

# --- Lock Screen -------------------------------------------------------------
# Turn display off: Never (applies to all power sources)
echo "🔒 Lock Screen: display never turns off..."
run sudo pmset -a displaysleep 0

# --- Keyboard -------------------------------------------------------------
# Shortcuts → Mission Control: Move left/right a space -> ⌘← / ⌘→
# macOS 26 (Tahoe) splits each action into primary/alternate symbolichotkeys
# slots: 79/80 = "Move left a space" (primary/alt), 81/82 = "Move right a
# space" (primary/alt). Older macOS used a simpler 79=left/80=right scheme;
# this sets the primary slot for each action and disables the alt slot so it
# doesn't retain a stray binding. (keycodes 123/124 = Left/Right Arrow;
# 1048576 = Cmd)
echo "⌨️  Keyboard: setting Mission Control move-space shortcuts to ⌘← / ⌘→..."
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 79 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>123</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 80 \
  '<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>123</integer><integer>9568256</integer></array><key>type</key><string>standard</string></dict></dict>'
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 81 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>124</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 82 \
  '<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>124</integer><integer>9568256</integer></array><key>type</key><string>standard</string></dict></dict>'
echo "  ℹ️  Restarting Dock/SystemUIServer to apply new shortcuts..."
run killall Dock >/dev/null 2>&1 || true
run killall SystemUIServer >/dev/null 2>&1 || true

# --- Mission Control: Desktops (Spaces) -----------------------------------
# Ensure there are at least TARGET_DESKTOPS desktops/spaces configured.
# There's no `defaults write` for Spaces; macOS manages them at runtime via
# the WindowManager process (Dock on older macOS), so this drives Mission
# Control's UI via Accessibility (System Events) and clicks "add desktop"
# until the target count is reached. Idempotent: only adds what's missing.
TARGET_DESKTOPS=4  # 1 default + 3 additional

ensure_accessibility_access() {
  if osascript -e 'tell application "System Events" to get name of every process' >/dev/null 2>&1; then
    return 0
  fi
  echo "🔐 Accessibility access is required to script Mission Control (Spaces)."
  echo "   Opening System Settings → Privacy & Security → Accessibility..."
  open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
  echo "   Add/enable your terminal app (e.g. Terminal, iTerm) in the list,"
  echo "   then come back here."
  read -r -p "   Press [Enter] once you've granted access (or Ctrl-C to skip)... "
  if osascript -e 'tell application "System Events" to get name of every process' >/dev/null 2>&1; then
    echo "   ✅ Accessibility access confirmed."
    return 0
  fi
  echo "   ⚠️  Still no Accessibility access. Skipping Mission Control desktops step."
  return 1
}

echo "🖥️  Mission Control: ensuring ${TARGET_DESKTOPS} desktops (spaces)..."
if ensure_accessibility_access; then
  osascript <<EOF >/dev/null 2>&1
tell application "System Events"
    -- macOS 26 (Tahoe) renders Mission Control via the "WindowManager" process;
    -- older macOS versions render it via "Dock" instead.
    set mcProcess to missing value
    repeat with pName in {"WindowManager", "Dock"}
        if exists process (pName as text) then
            set mcProcess to process (pName as text)
            exit repeat
        end if
    end repeat
    if mcProcess is missing value then error "Mission Control process not found"

    do shell script "open -b com.apple.exposelauncher"
    delay 1.2

    tell mcProcess
        set spacesBar to group "Spaces Bar" of group 1
        set spacesList to list 1 of spacesBar
        set addButton to button 1 of spacesBar
        set currentCount to count of (UI elements of spacesList)
        repeat while currentCount < ${TARGET_DESKTOPS}
            click addButton
            delay 0.6
            set currentCount to count of (UI elements of spacesList)
        end repeat
    end tell
    key code 53 -- Escape, exit Mission Control
end tell
EOF
  if [[ $? -eq 0 ]]; then
    echo "  ✅ Desktops ready."
  else
    echo "  ⚠️  Could not script Mission Control desktops (UI layout may differ on this macOS version)."
  fi
fi

# --- Users & Groups -------------------------------------------------------------
# Login Items: add Jumpcut and pCloud Drive if installed
echo "👤 Users & Groups: adding login items (Jumpcut, pCloud Drive) if installed..."
add_login_item() {
  local app_path="$1"
  if [[ -d "$app_path" ]]; then
    osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$app_path\", hidden:false}" \
      >/dev/null 2>&1 || echo "  ⚠️  Could not add login item: $app_path"
  else
    echo "  ⚠️  Skipping (not installed): $app_path"
  fi
}
add_login_item "/Applications/Jumpcut.app"
add_login_item "/Applications/pCloud Drive.app"

# --- Restart affected apps -------------------------------------------------------------
echo "🔄 Restarting Dock and Control Center..."
killall Dock >/dev/null 2>&1 || true
killall ControlCenter >/dev/null 2>&1 || true

echo "✅ All done!"
echo
echo "⚠️  Manual steps (not safely scriptable):"
echo "  - Users & Groups → Auto Login: alexclark (requires manual entry, not scripted for security)"
