# Load the checkoutmanager configuration files found
# in ~/.config/checkoutmanager
cm() {
  local cmd=$1

  if [ -z "$cmd" ]; then
    # Run checkoutmanager once with no arguments
    checkoutmanager
  else
    for cfg in ~/.config/checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done

    for cfg in ~/.checkoutmanager/*.cfg; do
      [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
    done
  fi
}
