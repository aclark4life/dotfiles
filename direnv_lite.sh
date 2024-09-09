# Define the base directory
BASE_DIR="$HOME/.config/direnv"

PROJECTS_DIR="$HOME/Developer"

# Variable to store the last checked directory
LAST_CHECKED_DIR=""

# Function to check and print file content
direnv() {
  # Get the current directory
  current_dir=$(pwd)
  
  # Check if the current directory is the same as the last checked directory
  if [[ "$current_dir" == "$LAST_CHECKED_DIR" ]]; then
    return
  fi
  
  # Update the last checked directory
  LAST_CHECKED_DIR="$current_dir"
  
  # Extract the relative path from the current directory
  relative_path="${current_dir#"$PROJECTS_DIR/"}"
  
  # Construct the path within the base directory
  target_file="$BASE_DIR/$relative_path/envrc"
  
  # Check if the file exists
  if [[ -f "$target_file" ]]; then
    source "$target_file"
  fi
}

# Add the function to the precmd hook to run before each prompt
precmd_functions+=(direnv)
