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
  read -r -p "   Press [Enter] once you've granted access (or Ctrl-C to skip)... "

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

# --- Firefox -------------------------------------------------------------
# Settings → General → Browsing: disable "Show previews for tabs in the
# taskbar and when switching tabs" (browser.tabs.hoverPreview.enabled).
# Firefox doesn't read macOS `defaults`; user.js is read at every launch and
# overrides whatever's in prefs.js, so this is safe even if Firefox is running.
echo "🦊 Firefox: disabling tab hover preview..."
nullglob_was_set=$(shopt -p nullglob)
shopt -s nullglob
firefox_profiles=("$HOME/Library/Application Support/Firefox/Profiles"/*)
if [[ ${#firefox_profiles[@]} -eq 0 ]]; then
  echo "  ⚠️  No Firefox profiles found, skipping."
else
  for profile in "${firefox_profiles[@]}"; do
    [[ -d "$profile" ]] || continue
    user_js="$profile/user.js"
    if grep -q '"browser.tabs.hoverPreview.enabled"' "$user_js" 2>/dev/null; then
      run sed -i '' 's/user_pref("browser.tabs.hoverPreview.enabled".*/user_pref("browser.tabs.hoverPreview.enabled", false);/' "$user_js"
    else
      run bash -c "echo 'user_pref(\"browser.tabs.hoverPreview.enabled\", false);' >> \"$user_js\""
    fi
  done
fi
eval "$nullglob_was_set"

# Settings → Bookmarks toolbar: "Never" (browser.toolbars.bookmarks.visibility).
echo "🦊 Firefox: hiding bookmarks toolbar..."
nullglob_was_set=$(shopt -p nullglob)
shopt -s nullglob
firefox_profiles=("$HOME/Library/Application Support/Firefox/Profiles"/*)
if [[ ${#firefox_profiles[@]} -eq 0 ]]; then
  echo "  ⚠️  No Firefox profiles found, skipping."
else
  for profile in "${firefox_profiles[@]}"; do
    [[ -d "$profile" ]] || continue
    user_js="$profile/user.js"
    if grep -q '"browser.toolbars.bookmarks.visibility"' "$user_js" 2>/dev/null; then
      run sed -i '' 's/user_pref("browser.toolbars.bookmarks.visibility".*/user_pref("browser.toolbars.bookmarks.visibility", "never");/' "$user_js"
    else
      run bash -c "echo 'user_pref(\"browser.toolbars.bookmarks.visibility\", \"never\");' >> \"$user_js\""
    fi
  done
fi
eval "$nullglob_was_set"

# Settings → Home → Homepage and new windows: "https://www.google.com"
# (browser.startup.homepage). This also controls the Home button's target.
echo "🦊 Firefox: setting homepage to google.com..."
nullglob_was_set=$(shopt -p nullglob)
shopt -s nullglob
firefox_profiles=("$HOME/Library/Application Support/Firefox/Profiles"/*)
if [[ ${#firefox_profiles[@]} -eq 0 ]]; then
  echo "  ⚠️  No Firefox profiles found, skipping."
else
  for profile in "${firefox_profiles[@]}"; do
    [[ -d "$profile" ]] || continue
    user_js="$profile/user.js"
    if grep -q '"browser.startup.homepage"' "$user_js" 2>/dev/null; then
      run sed -i '' 's#user_pref("browser.startup.homepage".*#user_pref("browser.startup.homepage", "https://www.google.com");#' "$user_js"
    else
      run bash -c "echo 'user_pref(\"browser.startup.homepage\", \"https://www.google.com\");' >> \"$user_js\""
    fi
  done
fi
eval "$nullglob_was_set"

# Settings → Home → New Windows and Tabs → New tabs: "Blank Page"
# (browser.newtabpage.enabled).
echo "🦊 Firefox: setting new tab to a blank page..."
nullglob_was_set=$(shopt -p nullglob)
shopt -s nullglob
firefox_profiles=("$HOME/Library/Application Support/Firefox/Profiles"/*)
if [[ ${#firefox_profiles[@]} -eq 0 ]]; then
  echo "  ⚠️  No Firefox profiles found, skipping."
else
  for profile in "${firefox_profiles[@]}"; do
    [[ -d "$profile" ]] || continue
    user_js="$profile/user.js"
    if grep -q '"browser.newtabpage.enabled"' "$user_js" 2>/dev/null; then
      run sed -i '' 's/user_pref("browser.newtabpage.enabled".*/user_pref("browser.newtabpage.enabled", false);/' "$user_js"
    else
      run bash -c "echo 'user_pref(\"browser.newtabpage.enabled\", false);' >> \"$user_js\""
    fi
  done
fi
eval "$nullglob_was_set"

# Add the Home button to the toolbar. Unlike the prefs above, toolbar layout
# (browser.uiCustomization.state) is normal, user-changeable state that
# Firefox rewrites to prefs.js on every exit, so we deliberately edit
# prefs.js (not user.js, which would clobber future manual customizations)
# and only merge "home-button" into whatever layout already exists.
echo "🦊 Firefox: adding Home button to the toolbar..."
if pgrep -x firefox >/dev/null 2>&1; then
  echo "  ⚠️  Firefox is running; quit it and re-run this script (Firefox" \
       "rewrites prefs.js on exit, which would undo this change)."
else
  nullglob_was_set=$(shopt -p nullglob)
  shopt -s nullglob
  firefox_profiles=("$HOME/Library/Application Support/Firefox/Profiles"/*)
  if [[ ${#firefox_profiles[@]} -eq 0 ]]; then
    echo "  ⚠️  No Firefox profiles found, skipping."
  else
    for profile in "${firefox_profiles[@]}"; do
      [[ -d "$profile" ]] || continue
      run python3 - "$profile/prefs.js" <<'PYEOF'
import json
import re
import sys
from pathlib import Path

prefs_path = Path(sys.argv[1])
DEFAULT_NAVBAR = [
    "back-button", "forward-button", "stop-reload-button", "home-button",
    "spring", "urlbar-container", "spring", "downloads-button",
    "fxa-toolbar-menu-button",
]

pattern = re.compile(
    r'user_pref\("browser\.uiCustomization\.state",\s*("(?:[^"\\]|\\.)*")\);'
)

if not prefs_path.exists():
    text = ""
else:
    text = prefs_path.read_text()

match = pattern.search(text)
try:
    if match:
        state = json.loads(json.loads(match.group(1)))
        navbar = state.setdefault("placements", {}).setdefault("nav-bar", [])
        if "home-button" in navbar:
            print("  ℹ️  Home button already on the toolbar.")
            sys.exit(0)
        idx = navbar.index("stop-reload-button") + 1 if "stop-reload-button" in navbar else 0
        navbar.insert(idx, "home-button")
    else:
        state = {"placements": {"nav-bar": DEFAULT_NAVBAR}}
except (json.JSONDecodeError, ValueError) as exc:
    print(f"  ⚠️  Couldn't parse existing toolbar layout, skipping: {exc}")
    sys.exit(0)

new_literal = json.dumps(json.dumps(state, separators=(",", ":")))
new_line = f'user_pref("browser.uiCustomization.state", {new_literal});'

if match:
    text = text[:match.start()] + new_line + text[match.end():]
else:
    text = text + ("\n" if text and not text.endswith("\n") else "") + new_line + "\n"

prefs_path.write_text(text)
print("  ✅ Home button added to the toolbar.")
PYEOF
    done
  fi
  eval "$nullglob_was_set"
fi

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
# Give Dock/WindowManager time to come back before scripting Mission Control below.
sleep 3

# --- Desktop & Dock: Mission Control mouse shortcut -----------------------
# Desktop & Dock → Mission Control → Mouse shortcut: Middle Mouse Button.
# macOS stores mouse shortcuts in com.apple.symbolichotkeys alongside the
# keyboard ones, but with `type` = "button" instead of "standard". Setting
# the Mission Control mouse shortcut writes a pair of entries: 38 = Mission
# Control, 40 = Application Windows (the same button plus ⇧, modifier mask
# 131072). Parameters are (button, button, modifiers); 4 = middle button.
echo "🖱  Desktop & Dock: mapping middle mouse button to Mission Control..."
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 38 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>4</integer><integer>4</integer><integer>0</integer></array><key>type</key><string>button</string></dict></dict>'
run defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 40 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>4</integer><integer>4</integer><integer>131072</integer></array><key>type</key><string>button</string></dict></dict>'

# --- Mission Control: Desktops (Spaces) -----------------------------------
# Ensure there are at least TARGET_DESKTOPS desktops/spaces configured.
# There's no `defaults write` for Spaces; macOS manages them at runtime via
# the WindowManager process (Dock on older macOS), so this drives Mission
# Control's UI via Accessibility (System Events) and clicks "add desktop"
# until the target count is reached. Idempotent: only adds what's missing.
TARGET_DESKTOPS=4  # 1 default + 3 additional

ensure_accessibility_access() {
  local purpose="${1:-script System Events}"
  if osascript -e 'tell application "System Events" to get name of every process' >/dev/null 2>&1; then
    return 0
  fi
  echo "🔐 Accessibility access is required to ${purpose}."
  echo "   Opening System Settings → Privacy & Security → Accessibility..."
  open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
  echo "   Add/enable your terminal app (e.g. Terminal, iTerm) in the list,"
  echo "   then come back here."
  read -r -p "   Press [Enter] once you've granted access (or Ctrl-C to skip)... "
  if osascript -e 'tell application "System Events" to get name of every process' >/dev/null 2>&1; then
    echo "   ✅ Accessibility access confirmed."
    return 0
  fi
  echo "   ⚠️  Still no Accessibility access."
  return 1
}

echo "🖥️  Mission Control: ensuring ${TARGET_DESKTOPS} desktops (spaces)..."
if ensure_accessibility_access "script Mission Control (Spaces)"; then
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

# --- Desktop & Screen Saver: Wallpaper rotation ---------------------------
# Desktop & Screen Saver → Desktop picture → Change picture: rotate the
# desktop wallpaper hourly from macOS's built-in wallpaper collection, on
# every display. Spaces share one desktop picture by default, so this
# covers all Mission Control desktops too.
#
# The native "Change picture" rotation exposed via System Events' `desktop`
# scripting properties (picture rotation, random order, change interval)
# throws AppleEvent handler errors on this macOS build, so instead we
# install a LaunchAgent that runs wallpaper-rotate.sh hourly, which picks a
# random image and sets it directly (System Events' `set picture of every
# desktop` does work reliably). Note: the `.madesktop` bundles in
# /System/Library/Desktop Pictures are accepted but render as a solid color,
# so wallpaper-rotate.sh only uses plain image files.
WALLPAPER_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/wallpaper-rotate.sh"
WALLPAPER_AGENT_LABEL="com.aclark4life.wallpaper-rotate"
WALLPAPER_AGENT_PLIST="$HOME/Library/LaunchAgents/${WALLPAPER_AGENT_LABEL}.plist"

echo "🖼  Desktop: installing hourly wallpaper rotation LaunchAgent..."
mkdir -p "$HOME/Library/LaunchAgents"
cat > "$WALLPAPER_AGENT_PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${WALLPAPER_AGENT_LABEL}</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>${WALLPAPER_SCRIPT}</string>
    </array>
    <key>StartInterval</key>
    <integer>3600</integer>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
run launchctl bootout "gui/$(id -u)/${WALLPAPER_AGENT_LABEL}" >/dev/null 2>&1
run launchctl bootstrap "gui/$(id -u)" "$WALLPAPER_AGENT_PLIST"
echo "  ✅ Wallpaper rotates every hour (LaunchAgent: ${WALLPAPER_AGENT_LABEL})."
echo "  ℹ️  The agent needs Automation → System Events permission for /bin/bash;"
echo "     approve the prompt the first time it runs (Privacy & Security → Automation)."

# --- Users & Groups -------------------------------------------------------------
# Login Items: add Jumpcut and pCloud Drive if installed
echo "👤 Users & Groups: adding login items (Jumpcut, pCloud Drive) if installed..."
add_login_item() {
  local app_path="$1"
  local app_name
  app_name="$(basename "$app_path" .app)"
  if [[ ! -d "$app_path" ]]; then
    echo "  ⚠️  Skipping (not installed): $app_path"
    return
  fi
  if osascript -e "tell application \"System Events\" to get name of login item \"$app_name\"" >/dev/null 2>&1; then
    echo "  ℹ️  Already a login item: $app_name"
    return
  fi
  osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$app_path\", hidden:false}" \
    >/dev/null 2>&1 || echo "  ⚠️  Could not add login item: $app_path"
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
echo "  - Trackpad → More Gestures → Zoom in or out: uncheck to disable pinch-to-zoom"
echo "    ('defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool false' is set correctly"
echo "    but has no effect on this macOS build; toggle it manually in System Settings instead.)"
echo "  - Chrome → Tab hover-card previews: gated by the 'TabHoverCardImages' Chrome"
echo "    feature flag, not a preference; disable via chrome://flags or by launching"
echo "    Chrome with --disable-features=TabHoverCardImages."
echo "  - Chrome → Show Home button + homepage: Chrome protects these settings with"
echo "    a tamper-check (a hash in its Preferences file) and silently resets them"
echo "    ~15-20s after launch if changed outside the app, so this can't be scripted."
echo "    Set manually: chrome://settings/appearance → 'Show Home button' → enter"
echo "    https://www.google.com."
