#!/bin/bash
# =============================================================================
# Author: [=Zac|ZNômade=]
# Creation Date: 2024-07-10
# Last Modified: 2024-07-10
# Version: 1.0
# License: None
#
# Description:
# This script checks the HTTP STATUS of the provided links - checks if the link is valid.
#
# Usage:
# ./script_name.sh FILE_WITH_LINKS
#
# Parameters:
# FILE_WITH_LINKS - Files containing the links to be checked.
#
# Output:
# Shows the status code of the links provided
#
# Example Usage:
# ./script_name.sh Links.txt
#
# Notes:
# Make sure you have the permissions for execution of script.
#
# To contribute to improving the script visit:
# https://github.com/ZNomade/scriptz/shell_scriptz
#
# Revision History:
# Version 1.0: 2024-07-10 - Initial version of the script.
#
# =============================================================================

# Function to check if a URL is alive
check_url() {
    local url=$1
    local response=$(curl -s -o /dev/null -w "%{http_code}" $url)
    
    if [[ $response -eq 200 ]]; then
        echo "The URL $url is alive (HTTP 200 OK)"
    else
        echo "The URL $url is not alive (HTTP $response)"
    fi
}

# Check if a file containing URLs is provided as an argument
if [[ -z $1 ]]; then
    echo "Usage: $0 <file_containing_urls>"
    exit 1
fi

# Read the file line by line and check each URL
while read -r url; do
    if [[ -n $url ]]; then
        check_url $url
    fi
done < "$1"