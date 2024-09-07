# Load the checkoutmanager configuration files found
# in ~/.checkoutmanager or ~/.config/checkoutmanager
cm() {
  local cmd=$1

  if [ -z "$cmd" ]; then
    # Run checkoutmanager once with no arguments
    checkoutmanager
  else
    # Run checkoutmanager with the provided command and configuration files
    [ -f ~/.checkoutmanager.cfg ] && checkoutmanager "$cmd" -c ~/.checkoutmanager.cfg
    for cfg in ~/.checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done

    for cfg in ~/.config/checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done
  fi
}
