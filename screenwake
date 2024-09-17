#!/bin/bash

# Assign a default value of 3 if no argument is provided
HOURS=${1:-3}

# Convert hours to seconds
SECONDS=$((HOURS * 3600))

# Display a toast notification
notify-send "Keep Awake Script" "The system will stay awake for $HOURS hour(s)."

# Function to keep the system awake
keep_awake() {
  while [ $SECONDS -gt 0 ]; do
    # Simulate user activity
    xset s reset
    xset -dpms
    xset s off
    # xdotool key shift
    
    # Sleep for a while before the next activity
    sleep 60
    
    # Decrement the countdown
    SECONDS=$((SECONDS - 60))
  done
  
  # Re-enable DPMS and screen saver after the script ends
  xset +dpms
  xset s on
}

# Call the function
keep_awake
