case `uname` in
  Darwin)
	# Define the dock path (formerly folder path) you want to add to the Dock
	DOCK_PATH="$HOME/Dotfiles/server"

	# Check if the dock is already in the Dock
	if ! defaults read com.apple.dock persistent-others | grep -q "$DOCK_PATH"; then
	    # Add the dock (folder) to the Dock
	    defaults write com.apple.dock persistent-others -array-add \
	    "<dict>
		<key>tile-data</key>
		<dict>
		    <key>file-data</key>
		    <dict>
			<key>_CFURLString</key>
			<string>file://$DOCK_PATH</string>
			<key>_CFURLStringType</key>
			<integer>15</integer>
		    </dict>
		</dict>
		<key>tile-type</key>
		<string>directory-tile</string>
	    </dict>"

	    # Restart the Dock to apply changes
	    killall Dock
	fi
  ;;
esac

# case `uname` in
#   Darwin)
#   osascript $HOME/.terminal-background-color.scpt
#   ;;
# esac

if [[ -z "$ZSH_SESSION_ONCE" && ! -f /tmp/terminal-session-started ]]; then
  export ZSH_SESSION_ONCE=1
  touch /tmp/terminal-session-started

  # ✅ Your Oh My Zsh functions and aliases are available here
  echo "Hello, this runs only once per Terminal app launch"

  # Example: Run an Oh My Zsh function (e.g., `extract` or custom)
  u
fi
