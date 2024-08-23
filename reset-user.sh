#!/bin/bash

# Stop plex servier
sudo systemctl stop plexmediaserver

# Default file path
default_filename="/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Preferences.xml"

# Use provided argument if available, otherwise use the default path
filename="${1:-$default_filename}"

# Ensure that the file exists
if [ ! -f "$filename" ]; then
    echo "File $filename does not exist!"
    exit 1
fi

# Define the tags to remove
tags=("PlexOnlineHome" "PlexOnlineMail" "PlexOnlineToken" "PlexOnlineUsername")

# Create a backup of the original file
cp "$filename" "${filename}.bak"

# Remove tags from the file
for tag in "${tags[@]}"; do
    sed -i "/$tag=\"[^\"]*\"/d" "$filename"
done

echo "Tags removed from file: $filename"
echo "Backup of original file created: ${filename}.bak"

# Start plex servier
sudo systemctl start plexmediaserver
