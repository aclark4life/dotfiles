-- Via https://apple.stackexchange.com/a/348808
tell application "Terminal"
    set themes to {"Basic", "Homebrew", "Man Page", "Novel", "Pro", "Grass", "Ocean", "Red Sands", "Silver Aerogel", "Solid Colors"}
    set theme to some item of themes
    set current settings of window 1 to settings set theme
end tell
